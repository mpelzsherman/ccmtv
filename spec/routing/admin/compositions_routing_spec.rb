require "spec_helper"

describe Admin::CompositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/compositions").should route_to("admin/compositions#index")
    end

    it "routes to #new" do
      get("/admin/compositions/new").should route_to("admin/compositions#new")
    end

    it "routes to #show" do
      get("/admin/compositions/1").should route_to("admin/compositions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/compositions/1/edit").should route_to("admin/compositions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/compositions").should route_to("admin/compositions#create")
    end

    it "routes to #update" do
      put("/admin/compositions/1").should route_to("admin/compositions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/compositions/1").should route_to("admin/compositions#destroy", :id => "1")
    end

  end
end
