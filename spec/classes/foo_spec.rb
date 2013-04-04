require 'spec_helper'

describe "example::foo" do

  describe "file-based hiera test" do
    describe 'should contain_notify("foo").with_message("bar")' do
      let(:hiera_config) do
        { :backends => ['yaml'],
          :hierarchy => ['example'],
          :yaml => {
            :datadir => File.expand_path(File.join(__FILE__, '..', '..', 'fixtures', 'modules', 'example', 'hieradata')) }}
      end
      it { should contain_notify("foo").with_message("bar") }
    end
  end
end
