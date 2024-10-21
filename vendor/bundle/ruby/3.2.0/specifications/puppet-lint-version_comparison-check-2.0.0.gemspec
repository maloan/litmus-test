# -*- encoding: utf-8 -*-
# stub: puppet-lint-version_comparison-check 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-lint-version_comparison-check".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Vox Pupuli".freeze]
  s.date = "2023-04-21"
  s.description = "    A puppet-lint plugin to check for versions compared as numbers.\n".freeze
  s.email = "voxpupuli@groups.io".freeze
  s.homepage = "https://github.com/voxpupuli/puppet-lint-version_comparison-check".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A puppet-lint plugin to check for versions compared as numbers.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<puppet-lint>.freeze, [">= 3", "< 5"])
end
