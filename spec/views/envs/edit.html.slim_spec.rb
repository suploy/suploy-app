require 'spec_helper'

describe "envs/edit" do
  before(:each) do
    @env = assign(:env, stub_model(Env,
      :name => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit env form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", env_path(@env), "post" do
      assert_select "input#env_name[name=?]", "env[name]"
      assert_select "input#env_value[name=?]", "env[value]"
    end
  end
end
