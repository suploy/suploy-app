require "spec_helper"

describe Api::Users::SshKeysController do
  describe "routing" do

    it "routes to #index" do
      get("/ssh_keys").should route_to("ssh_keys#index")
    end

    it "routes to #new" do
      get("/ssh_keys/new").should route_to("ssh_keys#new")
    end

    it "routes to #show" do
      get("/ssh_keys/1").should route_to("ssh_keys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ssh_keys/1/edit").should route_to("ssh_keys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ssh_keys").should route_to("ssh_keys#create")
    end

    it "routes to #update" do
      put("/ssh_keys/1").should route_to("ssh_keys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ssh_keys/1").should route_to("ssh_keys#destroy", :id => "1")
    end

  end
end
