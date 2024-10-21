# -*- encoding: utf-8 -*-
# stub: orchestrator_client 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "orchestrator_client".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet".freeze]
  s.date = "2023-04-28"
  s.email = "info@puppetlabs.com".freeze
  s.homepage = "https://github.com/puppetlabs/orchestrator_client-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Simple Ruby client library for PE Orchestration Services".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 1.4"])
  s.add_runtime_dependency(%q<net-http-persistent>.freeze, ["~> 4.0"])
end
