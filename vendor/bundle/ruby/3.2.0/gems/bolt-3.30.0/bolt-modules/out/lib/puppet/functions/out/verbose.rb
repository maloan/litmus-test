# frozen_string_literal: true

require 'bolt/util/format'

# Output a message for the user when running in verbose mode.
#
# This will print a message to stdout when using the human output format,
# and print to stderr when using the json output format. Messages are
# also logged at the `debug` level. For more information about logs, see
# [Logs](logs.md).
#
# > **Note:** Not available in apply block
Puppet::Functions.create_function(:'out::verbose') do
  # @param message The message to output.
  # @example Print a message
  #   out::verbose('Something went wrong')
  dispatch :output_verbose do
    param 'Any', :message
    return_type 'Undef'
  end

  def output_verbose(message)
    unless Puppet[:tasks]
      raise Puppet::ParseErrorWithIssue
        .from_issue_and_stack(Bolt::PAL::Issues::PLAN_OPERATION_NOT_SUPPORTED_WHEN_COMPILING, action: 'out::verbose')
    end

    Puppet.lookup(:bolt_executor).tap do |executor|
      executor.report_function_call(self.class.name)
      executor.publish_event(type: :verbose, message: Bolt::Util::Format.stringify(message), level: :debug)
    end

    nil
  end
end
