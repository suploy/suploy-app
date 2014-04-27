require "spec_helper"

describe Profiles::SshKeysController do
  describe "routing" do

    it "routes to #index" do
      get("/profiles/ssh_keys").should route_to("profiles/ssh_keys#index")
    end

    it "routes to #create" do
      post("/profiles/ssh_keys").should route_to("profiles/ssh_keys#create")
    end

    it "routes to #destroy" do
      delete("/profiles/ssh_keys/1").should route_to("profiles/ssh_keys#destroy", id: "1")
    end

  end
end
