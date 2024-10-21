# frozen_string_literal: true

require 'puppet-debugger/input_responder_plugin'
module PuppetDebugger
  module InputResponders
    class Reset < InputResponderPlugin
      COMMAND_WORDS = %w[reset].freeze
      SUMMARY = 'Reset the debugger to a clean state.'
      COMMAND_GROUP = :context

      def run(_args = [])
        debugger.set_scope(nil)
        debugger.set_remote_node_name(nil)
        debugger.set_node(nil)
        debugger.set_facts(nil)
        debugger.set_environment(nil)
        debugger.set_compiler(nil)
        # debugger.handle_input(":set loglevel #{debugger.log_level}")
        nil
      end
    end
  end
end
