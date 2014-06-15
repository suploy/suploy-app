require 'spec_helper'

describe "envs/new" do
  before(:each) do
    assign(:env, stub_model(Env,
      :name => "MyString",
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new env form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", envs_path, "post" do
      assert_select "input#env_name[name=?]", "env[name]"
      assert_select "input#env_value[name=?]", "env[value]"
    end
  end
end
