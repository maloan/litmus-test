# -*- encoding: utf-8 -*-
# stub: scanf 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "scanf".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Alan Black".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-12-11"
  s.description = "scanf is an implementation of the C function scanf(3).".freeze
  s.email = ["dblack@superlink.net".freeze]
  s.homepage = "https://github.com/ruby/scanf".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "scanf is an implementation of the C function scanf(3).".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
end
