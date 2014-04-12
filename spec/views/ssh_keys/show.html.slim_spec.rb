require 'spec_helper'

describe "ssh_keys/show" do
  before(:each) do
    @ssh_key = assign(:ssh_key, stub_model(SshKey,
      :title => "Title",
      :fingerprint => "Fingerprint",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Fingerprint/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
