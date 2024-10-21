# frozen_string_literal: true

# https://relishapp.com/rspec/rspec-core/v/3-6/docs/example-groups/shared-examples
RSpec.shared_examples 'plugin_tests' do |_parameter|
  let(:plugin) do
    instance = PuppetDebugger::InputResponders::Commands.plugin_from_command(subject.to_s).instance
    instance.debugger = debugger
    instance
  end

  let(:output) do
    StringIO.new
  end

  let(:debugger) do
    PuppetDebugger::Cli.new({ out_buffer: output }.merge(options))
  end

  let(:options) do
    {}
  end

  it 'commands content is an array' do
    expect(plugin.class::COMMAND_WORDS).to be_a(Array)
  end

  it 'commands must contain at least one word' do
    expect(plugin.class::COMMAND_WORDS.count).to be > 0
  end

  it 'summary must be a string' do
    expect(plugin.class::SUMMARY).to be_a(String)
  end

  it 'implements run' do
    expect { plugin.run([]) }.not_to raise_error
  end

  it 'be looked up via any command words' do
    plugin.class::COMMAND_WORDS.each do |word|
      actual = PuppetDebugger::InputResponders::Commands.plugin_from_command(word.to_s).instance.class
      expect(actual).to eq(plugin.class)
    end
  end
end
