# frozen_string_literal: true

require_relative '../lib/puppet-debugger'
require 'yaml'
ENV['CI'] = 'true'

if ENV['COVERAGE']
  require 'simplecov'

  module SimpleCov::Configuration
    def clean_filters
      @filters = []
    end
  end

  SimpleCov.configure do
    clean_filters
    load_profile 'test_frameworks'
  end

  if ENV['COVERAGE']
    SimpleCov.start do
      add_filter '/.rvm/'
      add_filter 'vendor'
      add_filter 'bundler'
    end
  end
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'puppet-debugger'
ENV['REPL_FACTERDB_FILTER'] = 'operatingsystem=Fedora and operatingsystemrelease=23 and architecture=x86_64 and facterversion=/^2\\.4/'
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

def stdlib_path
  File.join(Puppet[:basemodulepath].split(':').first, 'stdlib')
end

def install_stdlib
  `bundle exec puppet module install puppetlabs/stdlib` unless File.exist?(stdlib_path)
end

# install_stdlib

def fixtures_dir
  File.join(File.dirname(__FILE__), 'fixtures')
end

def environments_dir
  File.join(fixtures_dir, 'environments')
end

def supports_native_functions?
  Gem::Version.new(Puppet.version) >= Gem::Version.new('4.3')
end

def supports_type_function?
  Gem::Version.new(Puppet.version) >= Gem::Version.new('4.0')
end

def supports_datatypes?
  Gem::Version.new(Puppet.version) >= Gem::Version.new('4.5')
end

RSpec.configure do |config|
  config.filter_run_excluding native_functions: !supports_native_functions?
  RSpec::Expectations.configuration.on_potential_false_positives = :nothing
end
