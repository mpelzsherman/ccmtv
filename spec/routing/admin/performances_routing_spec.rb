require "spec_helper"

describe Admin::PerformancesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/performances").should route_to("admin/performances#index")
    end

    it "routes to #new" do
      get("/admin/performances/new").should route_to("admin/performances#new")
    end

    it "routes to #show" do
      get("/admin/performances/1").should route_to("admin/performances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/performances/1/edit").should route_to("admin/performances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/performances").should route_to("admin/performances#create")
    end

    it "routes to #update" do
      put("/admin/performances/1").should route_to("admin/performances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/performances/1").should route_to("admin/performances#destroy", :id => "1")
    end

  end
end
