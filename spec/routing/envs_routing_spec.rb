require "spec_helper"

describe EnvsController do
  describe "routing" do

    it "routes to #index" do
      get("/envs").should route_to("envs#index")
    end

    it "routes to #new" do
      get("/envs/new").should route_to("envs#new")
    end

    it "routes to #show" do
      get("/envs/1").should route_to("envs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/envs/1/edit").should route_to("envs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/envs").should route_to("envs#create")
    end

    it "routes to #update" do
      put("/envs/1").should route_to("envs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/envs/1").should route_to("envs#destroy", :id => "1")
    end

  end
end
