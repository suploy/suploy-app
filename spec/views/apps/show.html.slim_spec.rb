require 'spec_helper'

describe "apps/show" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :name => "Name",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Status/)
  end
end
