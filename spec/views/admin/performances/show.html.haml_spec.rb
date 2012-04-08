require 'spec_helper'

describe "admin_performances/show.html.haml" do
  before(:each) do
    @performance = assign(:performance, stub_model(Admin::Performance))
  end

  it "renders attributes in <p>" do
    render
  end
end
