class Performance < ActiveRecord::Base
  attr_accessible  :composition_tokens
  belongs_to :composition
  has_one    :composer, :through => :composition
  belongs_to :performance_type
  belongs_to :performer, :class_name => 'Person', :foreign_key => :person_id
  belongs_to :url
  has_and_belongs_to_many :urls
  scope :top10, limit(10)
  accepts_nested_attributes_for :composer, :performer
  attr_reader :composition_tokens

  def composition_tokens=(ids) # comma-separated
      self.composition_tokens = ids.split(',')
  end
end
