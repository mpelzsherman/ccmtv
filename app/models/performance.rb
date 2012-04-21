class Performance < ActiveRecord::Base
  belongs_to :composition
  has_one    :composer, :through => :composition
  belongs_to :performance_type
  belongs_to :performer, :class_name => 'Person', :foreign_key => :person_id
  belongs_to :url
  has_and_belongs_to_many :urls
  scope :top10, limit(10)
end
