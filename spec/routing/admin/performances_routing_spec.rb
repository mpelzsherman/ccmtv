require "spec_helper"

describe Admin::PerformancesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_performances").should route_to("admin_performances#index")
    end

    it "routes to #new" do
      get("/admin_performances/new").should route_to("admin_performances#new")
    end

    it "routes to #show" do
      get("/admin_performances/1").should route_to("admin_performances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_performances/1/edit").should route_to("admin_performances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_performances").should route_to("admin_performances#create")
    end

    it "routes to #update" do
      put("/admin_performances/1").should route_to("admin_performances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_performances/1").should route_to("admin_performances#destroy", :id => "1")
    end

  end
end
