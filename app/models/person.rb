class Person < ActiveRecord::Base
  has_many :epithets
  belongs_to :birth_location, :class_name => 'Location'
  belongs_to :death_location, :class_name => 'Location'

  scope :composers, where(:composer => true)
  scope :pianists,  where(:performer => true)
  scope :top10,     limit(10)

  validates_uniqueness_of :canonical_name
  validates_presence_of :canonical_name
  validates_length_of :canonical_name, :within => 2..200
  validate :categorised?

  def rank
    'N/A'
  end

  def views
    'N/A'
  end

  private

  # Must be at least one of these.
  def categorised?
    errors[:base] << "You must make the person either a composer, performer, or both" unless composer || performer
  end
end
