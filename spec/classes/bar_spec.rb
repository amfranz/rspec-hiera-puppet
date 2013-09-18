require 'spec_helper'

describe "example::bar" do

  describe "in-line hiera_data test" do
    let(:hiera_data) { { :bar_message => "baz" } }
    it { should contain_notify("bar").with_message("baz") }
  end

end

