# frozen_string_literal: true

require 'puppet-debugger/input_responder_plugin'
module PuppetDebugger
  module InputResponders
    class Commands < InputResponderPlugin
      COMMAND_WORDS = %w[commands].freeze
      SUMMARY = 'List all available commands, aka. this screen'
      COMMAND_GROUP = :help

      def run(_args = [])
        commands_list
      end

      def commands_list
        unless @commands_list
          @commands_list = ''
          command_groups.sort.each do |command_group|
            group_name = command_group[0].to_s.capitalize.bold
            commands = command_group[1]
            @commands_list += ' ' + group_name + "\n"
            commands.sort.each do |command|
              command_name = command[0]
              command_description = command[1]
              @commands_list += format("   %-20s %s\n", command_name, command_description)
            end
            @commands_list += "\n"
          end
        end
        @commands_list
      end

      def command_groups
        unless @command_groups
          @command_groups = {}
          self.class.command_output.each do |item|
            if @command_groups[item[:group]]
              @command_groups[item[:group]].merge!(item[:words].first => item[:summary])
            else
              @command_groups[item[:group]] = { item[:words].first => item[:summary] }
            end
          end
        end
        @command_groups
      end

      def self.command_list_regex
        out = command_list.map { |n| "^#{n}" }.join('|')
        /#{out}/
      end

      def self.command_list
        command_output.map { |f| f[:words] }.flatten
      end

      def self.command_output
        plugins.map(&:details)
      end

      def self.plugins
        debug_plugins = Pluginator.find('puppet-debugger')
        debug_plugins['input_responders']
      rescue NoMethodError
        raise PuppetDebugger::Exception::InvalidCommand.new(message: 'Unsupported gem version.  Please update with: gem update --system')
      end

      # @param name [String] - the name of the command that is associated with a plugin
      # @return [PuppetDebugger::InputResponders::InputResponderPlugin]
      def self.plugin_from_command(name)
        plug = plugins.find { |p| p::COMMAND_WORDS.include?(name) }
        raise PuppetDebugger::Exception::InvalidCommand.new(message: "invalid command #{name}") unless plug

        plug
      end
    end
  end
end
