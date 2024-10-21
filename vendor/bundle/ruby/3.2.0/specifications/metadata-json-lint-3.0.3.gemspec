# -*- encoding: utf-8 -*-
# stub: metadata-json-lint 3.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "metadata-json-lint".freeze
  s.version = "3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Vox Pupuli".freeze]
  s.date = "2023-04-24"
  s.description = "Utility to verify Puppet metadata.json files".freeze
  s.email = "voxpupuli@groups.io".freeze
  s.executables = ["metadata-json-lint".freeze]
  s.files = ["bin/metadata-json-lint".freeze]
  s.homepage = "https://github.com/voxpupuli/metadata-json-lint".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "metadata-json-lint /path/to/metadata.json".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<json-schema>.freeze, [">= 2.8", "< 5.0"])
  s.add_runtime_dependency(%q<spdx-licenses>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.57.2"])
  s.add_development_dependency(%q<semantic_puppet>.freeze, [">= 0"])
end
