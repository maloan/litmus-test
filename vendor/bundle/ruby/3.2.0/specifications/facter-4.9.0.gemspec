# -*- encoding: utf-8 -*-
# stub: facter 4.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "facter".freeze
  s.version = "4.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet".freeze]
  s.date = "2024-09-05"
  s.description = "You can prove anything with facts!".freeze
  s.email = ["team-nw@puppet.com".freeze]
  s.executables = ["facter".freeze]
  s.files = ["bin/facter".freeze]
  s.homepage = "https://github.com/puppetlabs/facter".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.5".freeze, "< 4.0".freeze])
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Facter, a system inventory tool".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<ffi>.freeze, [">= 1.15.5", "< 1.17.0", "!= 1.16.0", "!= 1.16.1", "!= 1.16.2"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0", ">= 13.0.6"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.28"])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.5.2"])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 2.10"])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
  s.add_development_dependency(%q<sys-filesystem>.freeze, ["~> 1.4"])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.12"])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
  s.add_runtime_dependency(%q<hocon>.freeze, ["~> 1.3"])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 1.0.1", "< 1.3"])
end
