require 'spec_helper'

describe Person do
  let(:composer)  { Person.create!(:canonical_name => 'Jim',  :person_type => :composer) }
  let(:performer) { Person.create!(:canonical_name => 'Sam Jones', :person_type => :performer)  }

  context "search" do
    before(:each) { composer; performer }

    it "should filter by composer" do
      result = Person.search(:person_type => :composer)
      result.should_not include(performer)
      result.should     include(composer)
    end

    it "should filter by performer" do
      result = Person.search(:person_type => :performer)
      result.should     include(performer)
      result.should_not include(composer)
    end

    it "should filter by name" do
      result = Person.search(:canonical_name => 'one')
      result.should     include(performer)
      result.should_not include(composer)
    end
  end
end
