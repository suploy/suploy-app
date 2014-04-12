require 'spec_helper'

describe "ssh_keys/edit" do
  before(:each) do
    @ssh_key = assign(:ssh_key, stub_model(SshKey,
      :title => "MyString",
      :fingerprint => "MyString",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit ssh_key form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ssh_key_path(@ssh_key), "post" do
      assert_select "input#ssh_key_title[name=?]", "ssh_key[title]"
      assert_select "input#ssh_key_fingerprint[name=?]", "ssh_key[fingerprint]"
      assert_select "textarea#ssh_key_content[name=?]", "ssh_key[content]"
      assert_select "input#ssh_key_user_id[name=?]", "ssh_key[user_id]"
    end
  end
end
