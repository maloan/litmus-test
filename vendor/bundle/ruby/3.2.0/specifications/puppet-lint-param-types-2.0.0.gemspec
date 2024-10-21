# -*- encoding: utf-8 -*-
# stub: puppet-lint-param-types 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-lint-param-types".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Vox Pupuli".freeze]
  s.date = "2023-04-21"
  s.description = "    A new check for puppet-lint that validates that all parameters are typed.\n".freeze
  s.email = "voxpupuli@groups.io".freeze
  s.homepage = "https://github.com/hostnet/puppet-lint-param-types".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "puppet-lint check that validates that all parameters are typed".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<puppet-lint>.freeze, [">= 3", "< 5"])
end
