# -*- encoding: utf-8 -*-
# stub: semantic_puppet 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "semantic_puppet".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet Labs".freeze]
  s.date = "2023-04-11"
  s.description = "Tools used by Puppet to parse, validate, and compare Semantic Versions and Version Ranges and to query and resolve module dependencies.".freeze
  s.email = ["info@puppetlabs.com".freeze]
  s.homepage = "https://github.com/puppetlabs/semantic_puppet".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Useful tools for working with Semantic Versions.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<cane>.freeze, [">= 0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  s.add_development_dependency(%q<redcarpet>.freeze, [">= 0"])
end
