class Person < ActiveRecord::Base
  EARLIEST_YEAR = 1500

  attr_accessible :person_type, :canonical_name, :date_of_birth, :date_of_death, :place_of_birth, :place_of_death

  belongs_to :birth_country, :class_name => 'Country'
  belongs_to :death_country, :class_name => 'Country'
  has_many :performances
  has_many :compositions
  has_many :performance_roles

  scope :composers,         where(person_type: :composer)
  scope :performers,        where(person_type: :performer)
  scope :top10,             limit(10)
  scope :by_canonical_name, order(:canonical_name)

  validates :canonical_name, :uniqueness => true, :presence => true, :length => {  :within => 2..200 }
  validates :person_type, presence: true

  def birth_location
    parts = []
    parts << place_of_birth unless place_of_birth.nil?
    parts << birth_country.name unless birth_country.nil?
    parts.join(', ')
  end

  def death_location
    parts = []
    parts << place_of_death unless place_of_death.nil?
    parts << death_country.name unless death_country.nil?
    parts.join(', ')
  end

  def rank
    I18n.t(:na)
  end

  def views
    I18n.t(:na)
  end

  # TODO: improve abstraction for groups. add drop down to person form.
  def self.expanded_types(type)
    case type
    when :performer
      "performer|ensemble|orchestra"
    when :composer
      "composer|arranger"
    end
  end

  def self.search params={}
    skope = scoped
    skope = skope.where(["person_type REGEXP ?", "#{expanded_types(params[:person_type])}"]) unless params[:person_type].blank?
    skope = skope.where(["canonical_name like ?", "%#{params[:canonical_name].downcase}%"]) unless params[:canonical_name].blank?
    skope
  end

  def composer?
    person_type == 'composer'
  end

  def performer?
    !person_type.downcase[/(performer|ensemble|orchestra)/].blank?
  end

end
