# -*- encoding: utf-8 -*-
# stub: puppet-lint-manifest_whitespace-check 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-lint-manifest_whitespace-check".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jo Vandeginste".freeze]
  s.date = "2023-04-22"
  s.description = "A new check for puppet-lint that validates generic whitespace issues in manifests.".freeze
  s.email = "jo.vandeginste@kuleuven.be".freeze
  s.homepage = "https://github.com/kuleuven/puppet-lint-manifest_whitespace-check".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A puppet-lint check to validate whitespace in manifests".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<puppet-lint>.freeze, [">= 1.0", "< 5"])
  s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  s.add_development_dependency(%q<mime-types>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.0"])
end
