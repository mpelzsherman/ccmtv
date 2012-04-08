require 'spec_helper'

describe "admin_performances/index.html.haml" do
  before(:each) do
    assign(:admin_performances, [
      stub_model(Admin::Performance),
      stub_model(Admin::Performance)
    ])
  end

  it "renders a list of admin_performances" do
    render
  end
end
