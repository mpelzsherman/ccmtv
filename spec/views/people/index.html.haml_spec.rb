require 'spec_helper'

describe "people/index.html.haml" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :composer => false,
        :performer => false,
        :birth_location_id => 1,
        :death_location_id => 1,
        :canonical_name => "Canonical Name"
      ),
      stub_model(Person,
        :composer => false,
        :performer => false,
        :birth_location_id => 1,
        :death_location_id => 1,
        :canonical_name => "Canonical Name"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Canonical Name".to_s, :count => 2
  end
end
