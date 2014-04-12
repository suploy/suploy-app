require 'spec_helper'

describe "apps/new" do
  before(:each) do
    assign(:app, stub_model(App,
      :name => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", apps_path, "post" do
      assert_select "input#app_name[name=?]", "app[name]"
      assert_select "input#app_status[name=?]", "app[status]"
    end
  end
end
