class Composition < ActiveRecord::Base
  belongs_to :composer, :class_name => 'Person', :foreign_key => :person_id
  belongs_to :musical_key

  scope :top10, limit(10)
end
