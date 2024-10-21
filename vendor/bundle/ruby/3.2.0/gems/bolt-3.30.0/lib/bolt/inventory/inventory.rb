# frozen_string_literal: true

require_relative '../../bolt/inventory/group'
require_relative '../../bolt/inventory/target'

module Bolt
  class Inventory
    class Inventory
      attr_reader :plugins, :source, :targets, :transport

      # Getting targets from the inventory using '--targets' supports extended glob pattern
      # matching. In this case, use the extended regex so Bolt only uses commas outside
      # brackets and braces as delimiters.
      EXTENDED_TARGET_REGEX = /[[:space:],]+(?=[^\]}]*(?:[\[{]|$))/.freeze
      TARGET_REGEX          = /[[:space:],]+/.freeze

      # Pattern which looks for indicators that glob-based target name matching
      # should be used.
      GLOB_MATCH_REGEX      = /[*?\[\]{}]/.freeze

      class WildcardError < Bolt::Error
        def initialize(target)
          super("Found 0 targets matching wildcard pattern #{target}", 'bolt.inventory/wildcard-error')
        end
      end

      def initialize(data, transport, transports, plugins, source = nil)
        @logger          = Bolt::Logger.logger(self)
        @data            = data || {}
        @transport       = transport
        @config          = transports
        @config_resolved = transports.values.all?(&:resolved?)
        @plugins         = plugins
        @targets         = {}
        @source          = source
      end

      def version
        2
      end

      def target_implementation_class
        Bolt::Target
      end

      # Load and resolve the groups in the inventory. Loading groups resolves
      # all plugin references except for those for target data and config.
      #
      # @return [Bolt::Inventory::Group]
      #
      def groups
        @groups ||= Group.new(@data, @plugins, all_group: true).tap do |groups|
          groups.resolve_string_targets(groups.target_aliases, groups.all_targets)
          groups.validate
        end
      end

      # Return a list of all group names in the inventory.
      #
      # @return [Array[String]]
      #
      def group_names
        group_lookup.keys
      end

      # Return a map of all groups in the inventory.
      #
      # @return [Hash[String, Bolt::Inventory::Group]]
      #
      def group_lookup
        @group_lookup ||= groups.collect_groups
      end

      # Return a map of transport configuration for the inventory. Any
      # unresolved plugin references are resolved.
      #
      # @return [Hash[String, Bolt::Config::Transport]]
      #
      def config
        if @config_resolved
          @config
        else
          @config_resolved = true
          @config.each_value { |t| t.resolve(@plugins) unless t.resolved? }
        end
      end

      def group_names_for(target_name)
        group_data_for(target_name).fetch('groups', [])
      end

      def target_names
        groups.all_targets
      end
      # alias for analytics
      alias node_names target_names

      def get_targets(targets, ext_glob: false)
        target_array = expand_targets(targets, ext_glob: ext_glob)
        if target_array.is_a? Array
          target_array.flatten.uniq(&:name)
        else
          [target_array]
        end
      end

      def get_target(target)
        target_array = get_targets(target)
        if target_array.count > 1
          raise ValidationError.new("'#{target}' refers to #{target_array.count} targets", nil)
        end
        target_array.first
      end

      #### PRIVATE ####
      def group_data_for(target_name)
        groups.group_collect(target_name)
      end

      # Does a target match the glob-style wildcard?
      # Ignore case; use extended globs ({a,b}) when running from the CLI.
      def match_wildcard?(wildcard, target_name, ext_glob: false)
        if ext_glob
          File.fnmatch(wildcard, target_name, File::FNM_CASEFOLD | File::FNM_EXTGLOB)
        else
          File.fnmatch(wildcard, target_name, File::FNM_CASEFOLD)
        end
      end

      # If target is a group name, expand it to the members of that group.
      # Else match against groups and targets in inventory by name or alias.
      # Attempt exact matches for groups, targets, and aliases first for speed.
      # If no exact match and the string contains wildcard characters, then check
      # and see if the target string might be a URI, if it parses as a URI with
      # a scheme then return as-is, otherwise look for a wildcard match and
      # error if no matches are found.
      # Else fall back to [target] if no matches are found.
      def resolve_name(target, ext_glob: false)
        if (group = group_lookup[target])
          group.all_targets.to_a
        elsif @targets.key?(target)
          [target]
        elsif (real_target = groups.target_aliases[target])
          [real_target]
        elsif GLOB_MATCH_REGEX.match?(target)
          # URIs and glob wildcards have some overlapping characters. If the target
          # being resolved parses as a valid target URI and has a scheme defined then
          # return it as-is and do not try to do further wildcard matching:
          uri = begin
            Bolt::Inventory::Target.parse_uri(target)
          rescue Bolt::ParseError
            nil
          end
          return [target] if uri&.scheme

          targets = []

          # Find groups that match the glob
          group_lookup.each do |name, grp|
            next unless match_wildcard?(target, name, ext_glob: ext_glob)
            targets += grp.all_targets.to_a
          end

          # Find target names that match the glob
          targets += groups.all_targets.select { |targ| match_wildcard?(target, targ, ext_glob: ext_glob) }

          # Find target aliases that match the glob
          targets += groups.target_aliases
                           .select { |tgt_alias, _| match_wildcard?(target, tgt_alias, ext_glob: ext_glob) }
                           .values

          raise(WildcardError, target) if targets.empty?

          targets.uniq
        else # rubocop:disable Lint/DuplicateBranch
          [target]
        end
      end
      private :resolve_name

      def expand_targets(targets, ext_glob: false)
        case targets
        when Bolt::Target
          targets
        when Array
          targets.map { |tish| expand_targets(tish, ext_glob: ext_glob) }
        when String
          # Expand a comma-separated list
          # Regex magic below is required to workaround `{foo,bar}` glob syntax
          regex = ext_glob ? EXTENDED_TARGET_REGEX : TARGET_REGEX
          targets.split(regex).reject(&:empty?).map do |name|
            ts = resolve_name(name, ext_glob: ext_glob)
            ts.map do |t|
              # If the target doesn't exist, evaluate it from the inventory.
              # Then return a Bolt::Target.
              unless @targets.key?(t)
                @targets[t] = create_target_from_inventory(t)
              end
              Bolt::Target.new(t, self)
            end
          end
        end
      end
      private :expand_targets

      def remove_target(current_group, target, desired_group)
        if current_group.name == desired_group
          current_group.remove_target(target)
          target.invalidate_group_cache!
        end
        current_group.groups.each do |child_group|
          # If target was in current group, remove it from all child groups
          if current_group.name == desired_group
            remove_target(child_group, target, child_group.name)
          else
            remove_target(child_group, target, desired_group)
          end
        end
      end
      private :remove_target

      def add_target(current_group, target, desired_group)
        if current_group.name == desired_group
          current_group.add_target(target)
          target.invalidate_group_cache!
          return true
        end
        # Recurse on children Groups if not desired_group
        current_group.groups.each do |child_group|
          add_target(child_group, target, desired_group)
        end
      end
      private :add_target

      # Pull in a target definition from the inventory file and evaluate any
      # associated references. This is used when a target is resolved by
      # get_targets.
      def create_target_from_inventory(target_name)
        target_data = groups.target_collect(target_name) || { 'uri' => target_name }

        target = Bolt::Inventory::Target.new(target_data, self)
        @targets[target.name] = target

        add_to_group([target], 'all')

        target
      end

      # Add a brand new target, overriding any existing target with the same
      # name. This method does not honor target config from the inventory. This
      # is used when Target.new is called from a plan or with a data hash.
      def create_target_from_hash(data)
        # If target already exists, delete old and replace with new, otherwise add to new to all group
        new_target = Bolt::Inventory::Target.new(data, self)
        existing_target = @targets.key?(new_target.name)

        validate_target_from_hash(new_target)
        @targets[new_target.name] = new_target

        if existing_target
          clear_alia_from_group(groups, new_target.name)
        else
          add_to_group([new_target], 'all')
        end

        if new_target.target_alias
          groups.insert_alia(new_target.name, Array(new_target.target_alias))
        end

        new_target
      end

      def validate_target_from_hash(target)
        used_groups  = Set.new(group_names)
        used_targets = target_names

        # Make sure there are no group name conflicts
        if used_groups.include?(target.name)
          raise ValidationError.new("Target name #{target.name} conflicts with group of the same name", nil)
        end

        # Validate any aliases
        if (aliases = target.target_alias)
          unless aliases.is_a?(Array) || aliases.is_a?(String)
            msg = "Alias entry on #{t_name} must be a String or Array, not #{aliases.class}"
            raise ValidationError.new(msg, @name)
          end
        end

        # Make sure there are no conflicts with the new target aliases
        used_aliases = groups.target_aliases
        Array(target.target_alias).each do |alia|
          if used_groups.include?(alia)
            raise ValidationError.new("Alias #{alia} conflicts with group of the same name", nil)
          elsif used_targets.include?(alia)
            raise ValidationError.new("Alias #{alia} conflicts with target of the same name", nil)
          elsif used_aliases[alia] && used_aliases[alia] != target.name
            raise ValidationError.new(
              "Alias #{alia} refers to multiple targets: #{used_aliases[alia]} and #{target.name}", nil
            )
          end
        end
      end

      def clear_alia_from_group(group, target_name)
        if group.all_target_names.include?(target_name)
          group.clear_alia(target_name)
        end
        group.groups.each do |grp|
          clear_alia_from_group(grp, target_name)
        end
      end

      def remove_from_group(target, desired_group)
        unless target.length == 1
          raise ValidationError.new("'remove_from_group' expects a single Target, got #{target.length}", nil)
        end

        if desired_group == 'all'
          raise ValidationError.new("Cannot remove Target from Group 'all'", nil)
        end

        if group_names.include?(desired_group)
          remove_target(groups, @targets[target.first.name], desired_group)
        else
          raise ValidationError.new("Group #{desired_group} does not exist in inventory", nil)
        end
      end

      def add_to_group(targets, desired_group)
        if group_names.include?(desired_group)
          targets.each do |target|
            # Add the inventory copy of the target
            add_target(groups, @targets[target.name], desired_group)
          end
        else
          raise ValidationError.new("Group #{desired_group} does not exist in inventory", nil)
        end
      end

      def transport_data_get
        { transport: transport, transports: config.transform_values(&:to_h) }
      end

      def set_var(target, var_hash)
        @targets[target.name].set_var(var_hash)
      end

      def vars(target)
        @targets[target.name].vars
      end

      def add_facts(target, new_facts = {})
        @targets[target.name].add_facts(new_facts)
        target
      end

      def facts(target)
        @targets[target.name].facts
      end

      def set_feature(target, feature, value = true)
        @targets[target.name].set_feature(feature, value)
      end

      def features(target)
        @targets[target.name].features
      end

      def plugin_hooks(target)
        @targets[target.name].plugin_hooks
      end

      def set_config(target, key_or_key_path, value)
        @targets[target.name].set_config(key_or_key_path, value)
      end

      def target_config(target)
        @targets[target.name].config
      end

      def resources(target)
        @targets[target.name].resources
      end

      def resource(target, type, title)
        @targets[target.name].resource(type, title)
      end
    end
  end
end
