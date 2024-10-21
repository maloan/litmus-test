# -*- encoding: utf-8 -*-
# stub: puppet-debugger 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-debugger".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Corey Osman".freeze]
  s.date = "2024-01-18"
  s.description = "A interactive command line tool for evaluating and debugging the puppet language".freeze
  s.email = "corey@nwops.io".freeze
  s.executables = ["pdb".freeze, "puppet-debugger".freeze]
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze, "bin/pdb".freeze, "bin/puppet-debugger".freeze]
  s.homepage = "https://gitlab.com/puppet-debugger/puppet-debugger".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A repl based debugger for the puppet language".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<awesome_print>.freeze, ["~> 1.7"])
  s.add_runtime_dependency(%q<bundler>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<facterdb>.freeze, [">= 0.4.0"])
  s.add_runtime_dependency(%q<pluginator>.freeze, ["~> 1.5.0"])
  s.add_runtime_dependency(%q<puppet>.freeze, [">= 6"])
  s.add_runtime_dependency(%q<rb-readline>.freeze, [">= 0.5.5"])
  s.add_runtime_dependency(%q<table_print>.freeze, [">= 1.0.0"])
  s.add_runtime_dependency(%q<tty-pager>.freeze, ["~> 0.14"])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 6.0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 3.6"])
end
