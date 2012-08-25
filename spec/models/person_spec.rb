require 'spec_helper'

describe Person do
  let(:composer)  { Person.create!(:canonical_name => 'Jim',  :composer => true,  :performer => false) }
  let(:performer) { Person.create!(:canonical_name => 'Sam',  :composer => false, :performer => true)  }
  let(:both)      { Person.create!(:canonical_name => 'Lisa', :composer => true,  :performer => true)  }

  context "search" do
    before(:each) { composer; performer; both }

    it "should filter by composer" do
      result = Person.search(:composer => '1')
      result.should_not include(performer)
      result.should     include(both)
      result.should     include(composer)
    end

    it "should filter by performer" do
      result = Person.search(:performer => '1')
      result.should     include(performer)
      result.should     include(both)
      result.should_not include(composer)
    end

    it "should filter by performer and not composer" do
      result = Person.search(:performer => '1', :composer => '0')
      result.should     include(performer)
      result.should_not include(both)
      result.should_not include(composer)
    end

    it "should filter by composer and not performer" do
      result = Person.search(:performer => '0', :composer => '1')
      result.should_not include(performer)
      result.should_not include(both)
      result.should     include(composer)

    end

  end
end
