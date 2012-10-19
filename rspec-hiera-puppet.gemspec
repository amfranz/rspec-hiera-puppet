# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rspec-hiera-puppet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Franz Aigner"]
  gem.email         = ["amfranz@gmail.com"]
  gem.description   = %q{Hiera fixtures for rspec-puppet tests.}
  gem.summary       = %q{Hiera fixtures for rspec-puppet tests.}
  gem.homepage      = "https://github.com/amfranz/rspec-hiera-puppet"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rspec-hiera-puppet"
  gem.require_paths = ["lib"]
  gem.version       = Rspec::Hiera::Puppet::VERSION

  gem.add_dependency('puppet', '>= 3.0')
  gem.add_dependency('hiera', '>= 1.0')
  gem.add_dependency('hiera-puppet', '>= 1.0')
  gem.add_dependency('rspec')
  gem.add_dependency('rspec-puppet')
end
