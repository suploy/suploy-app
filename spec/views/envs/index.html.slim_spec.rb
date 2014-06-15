require 'spec_helper'

describe "envs/index" do
  before(:each) do
    assign(:envs, [
      stub_model(Env,
        :name => "Name",
        :value => "Value"
      ),
      stub_model(Env,
        :name => "Name",
        :value => "Value"
      )
    ])
  end

  it "renders a list of envs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
