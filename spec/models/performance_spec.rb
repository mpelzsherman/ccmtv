require 'spec_helper'

describe Performance do

  describe '#create' do

    let(:valid_attributes) do
      {
        :person_id => 1,
        :composition_tokens => '1',
        :performance_type_id => 1,
        :url_attributes => {:http => 'http://example.com', :embeded_code => '<embed>xyz</embed>'}
      }
    end

    it "should increase count by 1" do
      Performance.create! valid_attributes
    end

  end
end
