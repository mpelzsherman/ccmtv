require 'spec_helper'

describe "people/show.html.haml" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :composer => false,
      :performer => false,
      :birth_location_id => 1,
      :death_location_id => 1,
      :canonical_name => "Canonical Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Canonical Name/)
  end
end
