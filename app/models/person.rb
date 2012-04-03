class Person < ActiveRecord::Base
  has_many :epithets
  belongs_to :birth_location, :class_name => 'Location'
  belongs_to :death_location, :class_name => 'Location'
end
