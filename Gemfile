source :rubygems

gemspec

group :development, :test do
  gem 'puppetlabs_spec_helper', :require => false
  gem 'rspec'
  gem 'rspec-puppet'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '>= 3.0.0', :require => false
end

gem 'hiera'
gem 'hiera-puppet', '>= 1.0'
