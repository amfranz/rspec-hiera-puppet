require 'rspec'

module HieraPuppetHelper
  module HieraDefaultConfiguration
    extend RSpec::SharedContext

    let(:hiera_config) do
      { :backends => ['rspec'],
        :rspec => respond_to?(:hiera_data) ? hiera_data : {} }
    end
  end
end

RSpec.configure do |c|
  c.include(HieraPuppetHelper::HieraDefaultConfiguration)

  c.before(:each) do
    Thread.current[:spec] = self
  end

  c.after(:each) do
    Thread.current[:spec] = nil
  end
end
