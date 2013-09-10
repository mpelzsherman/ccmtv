class Performance < ActiveRecord::Base
  attr_accessible  :composition_tokens, :performance_type_id, :composition_id, :person_id, :url_attributes, :performer_attributes, :composition_attributes
  belongs_to :composition
  has_one    :composer, :through => :composition
  belongs_to :performance_type
  belongs_to :performer, :class_name => 'Person', :foreign_key => :person_id
  belongs_to :url
  scope :top10, limit(10)
  accepts_nested_attributes_for :composer, :performer, :composition, :url
  has_many :performance_roles, :dependent => :destroy
  accepts_nested_attributes_for :performance_roles

  validates :composition, :presence => true
  validates :performance_type, :presence => true
  validates :url, :presence => true

  # Using jQuery tokenInrput plugin. See http://railscasts.com/episodes/258-token-fields
  attr_reader :composition_tokens

  # setter method
  def composition_tokens=(ids) # comma-separated
    id = ids.split(',').first
    self.composition_id = id unless id.nil?
  end
end
