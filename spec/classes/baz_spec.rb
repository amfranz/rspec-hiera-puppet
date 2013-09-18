require 'spec_helper'

describe 'example::baz' do

  describe "test once" do
    let(:hiera_data) {{
      'example::baz::param' => 'boo'
    }}
  
    it { should contain_notify('boo').with_message('boo') }
  end

  #describe "test twice" do
  # let(:hiera_data) {{
  #   'example::baz::param' => 'baa'
  # }}
  #
  # it { should contain_notify('boo').with_message('baa') }
  #end
end
