require "spec_helper"

describe Api::Users::SshKeysController do
  describe "routing" do

    it "routes to #index" do
      get("/api/users/ssh_keys").should route_to("api/users/ssh_keys#index", format: :json)
    end

    it "routes to #show" do
      get("/api/users/ssh_keys/1").should route_to("api/users/ssh_keys#show", id: "1", format: :json)
    end

    it "routes to #create" do
      post("/api/users/ssh_keys").should route_to("api/users/ssh_keys#create", format: :json)
    end

    it "routes to #update" do
      put("/api/users/ssh_keys/1").should route_to("api/users/ssh_keys#update", id: "1", format: :json)
    end

    it "routes to #destroy" do
      delete("/api/users/ssh_keys/1").should route_to("api/users/ssh_keys#destroy", id: "1", format: :json)
    end

  end
end
