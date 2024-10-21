# frozen_string_literal: true

module BoltSpec
  module Plans
    class CommandStub < ActionStub
      def matches(targets, _command, options)
        if @invocation[:targets] && Set.new(@invocation[:targets]) != Set.new(targets.map(&:name))
          return false
        end

        if @invocation[:options] && options != @invocation[:options]
          return false
        end

        true
      end

      def call(targets, command, options)
        @calls += 1
        if @return_block
          check_resultset(@return_block.call(targets: targets, command: command, params: options), command)
        else
          Bolt::ResultSet.new(targets.map { |target| @data[target.name] || default_for(target) })
        end
      end

      def parameters
        @invocation[:options]
      end

      def result_for(target, stdout: '', stderr: '')
        value = {
          'stdout'        => stdout,
          'stderr'        => stderr,
          'merged_output' => "#{stdout}\n#{stderr}".strip,
          'exit_code'     => 0
        }

        Bolt::Result.for_command(target, value, 'command', '', [])
      end

      # Public methods

      def with_params(params)
        @invocation[:options] = params.select { |k, _v| k.start_with?('_') }
                                      .transform_keys { |k| k.sub(/^_/, '').to_sym }
        self
      end
    end
  end
end
