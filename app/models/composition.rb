class Composition < ActiveRecord::Base
  attr_accessible :person_id, :year_composed_begin, :year_composed_end, :rating, :catalog_num1, :catalog_num2, :catalog_num3, :views, :movement_num, :comp_group, :title, :movement_name, :rank
  belongs_to :composer, :class_name => 'Person', :foreign_key => :person_id

  scope :top10, limit(10)
end
