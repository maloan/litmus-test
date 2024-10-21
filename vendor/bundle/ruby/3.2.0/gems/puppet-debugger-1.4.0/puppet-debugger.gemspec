# frozen_string_literal: true

require_relative 'lib/puppet-debugger/version'
require 'date'

Gem::Specification.new do |s|
  s.name = 'puppet-debugger'
  s.version = PuppetDebugger::VERSION
  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|resources|local_test_results|pec)/}) }
  s.bindir        = 'bin'
  s.executables = %w[pdb puppet-debugger]
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.authors = ['Corey Osman']
  s.date = DateTime.now.strftime('%Y-%m-%d')
  s.description = 'A interactive command line tool for evaluating and debugging the puppet language'
  s.email = 'corey@nwops.io'
  s.extra_rdoc_files = [
    'CHANGELOG.md',
    'LICENSE.txt',
    'README.md'
  ]
  s.required_ruby_version = '>= 2.7'
  s.homepage = 'https://gitlab.com/puppet-debugger/puppet-debugger'
  s.licenses = ['MIT']
  s.rubygems_version = '2.4.5.1'
  s.summary = 'A repl based debugger for the puppet language'
  s.add_runtime_dependency('awesome_print', ['~> 1.7'])
  s.add_runtime_dependency('bundler')
  s.add_runtime_dependency('facterdb', ['>= 0.4.0'])
  s.add_runtime_dependency('pluginator', ['~> 1.5.0'])
  s.add_runtime_dependency('puppet', ['>= 6'])
  # s.add_runtime_dependency('bolt', ['>= 2.42.0'])
  s.add_runtime_dependency('rb-readline', ['>= 0.5.5'])
  s.add_runtime_dependency('table_print', ['>= 1.0.0'])
  s.add_runtime_dependency('tty-pager', ['~> 0.14'])
  s.add_development_dependency('rdoc', ['>= 6.0'])
  s.add_development_dependency('rspec', ['>= 3.6'])
end
