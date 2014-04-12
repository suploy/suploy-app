require 'spec_helper'

describe "ssh_keys/index" do
  before(:each) do
    assign(:ssh_keys, [
      stub_model(SshKey,
        :title => "Title",
        :fingerprint => "Fingerprint",
        :content => "MyText",
        :user_id => 1
      ),
      stub_model(SshKey,
        :title => "Title",
        :fingerprint => "Fingerprint",
        :content => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of ssh_keys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Fingerprint".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
