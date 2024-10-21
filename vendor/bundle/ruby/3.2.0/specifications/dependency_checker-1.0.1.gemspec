# -*- encoding: utf-8 -*-
# stub: dependency_checker 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dependency_checker".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "https://github.com/puppetlabs/dependency_checker" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ewoud Kohl van Wijngaarden".freeze, "Puppet".freeze]
  s.date = "2023-08-09"
  s.description = "    Verify all your dependencies allow the latest versions on Puppet Forge.\n    Based on https://github.com/ekohl/metadata_json_deps\n".freeze
  s.email = ["info@puppet.com".freeze]
  s.executables = ["dependency-checker".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze, "bin/dependency-checker".freeze]
  s.homepage = "https://github.com/puppetlabs/dependency_checker".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Check your Puppet metadata dependencies".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<parallel>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<puppet_forge>.freeze, [">= 2.2", "< 6.0"])
  s.add_runtime_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_runtime_dependency(%q<semantic_puppet>.freeze, ["~> 1.0"])
end
