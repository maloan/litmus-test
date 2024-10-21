# -*- encoding: utf-8 -*-
# stub: voxpupuli-puppet-lint-plugins 5.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "voxpupuli-puppet-lint-plugins".freeze
  s.version = "5.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Vox Pupuli".freeze]
  s.date = "2023-04-22"
  s.description = "A package that depends on all the puppet-lint-* gems Vox Pupuli modules need and puppet-lint itself".freeze
  s.email = ["pmc@voxpupuli.org".freeze]
  s.homepage = "https://github.com/voxpupuli/voxpupuli-puppet-lint-plugins".freeze
  s.licenses = ["AGPL-3.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Helper Gem that pulls in all the puppet-lint plugins that Vox Pupuli uses".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<puppet-lint>.freeze, ["~> 4.0"])
  s.add_runtime_dependency(%q<puppet-lint-absolute_classname-check>.freeze, ["~> 4.0"])
  s.add_runtime_dependency(%q<puppet-lint-anchor-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-file_ensure-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-leading_zero-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-lookup_in_parameter-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-manifest_whitespace-check>.freeze, ["~> 0.3", "< 1.0.0"])
  s.add_runtime_dependency(%q<puppet-lint-optional_default-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-param-docs>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-params_empty_string-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-param-types>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-resource_reference_syntax>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-strict_indent-check>.freeze, ["~> 3.0"])
  s.add_runtime_dependency(%q<puppet-lint-topscope-variable-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-trailing_comma-check>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-unquoted_string-check>.freeze, ["~> 3.0"])
  s.add_runtime_dependency(%q<puppet-lint-variable_contains_upcase>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<puppet-lint-version_comparison-check>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0", ">= 13.0.6"])
  s.add_development_dependency(%q<voxpupuli-rubocop>.freeze, ["~> 1.2"])
end
