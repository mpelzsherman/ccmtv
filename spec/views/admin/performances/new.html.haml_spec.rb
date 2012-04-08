require 'spec_helper'

describe "admin_performances/new.html.haml" do
  before(:each) do
    assign(:performance, stub_model(Admin::Performance).as_new_record)
  end

  it "renders new performance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_performances_path, :method => "post" do
    end
  end
end
