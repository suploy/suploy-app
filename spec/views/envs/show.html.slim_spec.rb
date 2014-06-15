require 'spec_helper'

describe "envs/show" do
  before(:each) do
    @env = assign(:env, stub_model(Env,
      :name => "Name",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Value/)
  end
end
