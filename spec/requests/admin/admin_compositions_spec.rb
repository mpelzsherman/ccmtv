require 'spec_helper'

describe "Admin::Compositions" do
  describe "GET /admin_compositions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_compositions_path
      response.status.should be(200)
    end
  end
end
