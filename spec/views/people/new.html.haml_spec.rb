require 'spec_helper'

describe "people/new.html.haml" do
  before(:each) do
    assign(:person, stub_model(Person,
      :composer => false,
      :performer => false,
      :birth_location_id => 1,
      :death_location_id => 1,
      :canonical_name => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_composer", :name => "person[composer]"
      assert_select "input#person_performer", :name => "person[performer]"
      assert_select "input#person_birth_location_id", :name => "person[birth_location_id]"
      assert_select "input#person_death_location_id", :name => "person[death_location_id]"
      assert_select "input#person_canonical_name", :name => "person[canonical_name]"
    end
  end
end
