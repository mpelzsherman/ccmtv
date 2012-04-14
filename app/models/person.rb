class Person < ActiveRecord::Base
  has_many :epithets
  belongs_to :birth_location, :class_name => 'Location'
  belongs_to :death_location, :class_name => 'Location'

  scope :composers, where(:composer => true)
  scope :pianists, where(:performer => true)
  scope :top10, limit(10)

  def rank
    'N/A'
  end

  def views
    'N/A'
  end
end
