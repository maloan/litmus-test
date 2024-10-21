# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{net-ssh-krb}
  s.version = "0.5.1"
  s.authors = ["Joe Khoobyar", "Chris Beer"]
  s.description = %q{Extends Net::SSH by adding Kerberos authentication capability for password-less logins on multiple platforms.
}
  s.email = %q{joe@ankhcraft.com cabeer@stanford.edu}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage = %q{http://github.com/cbeer/net-ssh-kerberos}
  s.summary = %q{Add Kerberos support to Net::SSH}

  s.add_dependency 'net-ssh', '>= 2.0'
  s.add_dependency 'gssapi', '~> 1.3.0'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', "~> 3.0"
end
