require 'spec_helper'

describe "admin_performances/edit.html.haml" do
  before(:each) do
    @performance = assign(:performance, stub_model(Admin::Performance))
  end

  it "renders the edit performance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_performances_path(@performance), :method => "post" do
    end
  end
end
