require "spec_helper"

describe Admin::CompositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_compositions").should route_to("admin_compositions#index")
    end

    it "routes to #new" do
      get("/admin_compositions/new").should route_to("admin_compositions#new")
    end

    it "routes to #show" do
      get("/admin_compositions/1").should route_to("admin_compositions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_compositions/1/edit").should route_to("admin_compositions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_compositions").should route_to("admin_compositions#create")
    end

    it "routes to #update" do
      put("/admin_compositions/1").should route_to("admin_compositions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_compositions/1").should route_to("admin_compositions#destroy", :id => "1")
    end

  end
end
