class Person < ActiveRecord::Base
  EARLIEST_YEAR = 1500

  belongs_to :birth_country, :class_name => 'Country'
  belongs_to :death_country, :class_name => 'Country'

  scope :composers,         where(person_type: :composer)
  scope :performers,        where(person_type: :performer)
  scope :top10,             limit(10)
  scope :by_canonical_name, order(:canonical_name)

  validates :canonical_name, :uniqueness => true, :presence => true, :length => {  :within => 2..200 }
  validate  :categorised?

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

  def self.search params={}
    skope = scoped
    skope = skope.where(["person_type = ?", params[:person_type]]) unless params[:person_type].blank?
    skope = skope.where(["canonical_name like ?", '%'+params[:canonical_name].downcase+'%']) unless params[:canonical_name].blank?
    skope
  end

  def composer?
    person_type == :composer
  end

  def performer?
    person_type == :performer
  end

  private

  def categorised?
    errors[:base] << I18n.t(:either_composer_or_performer) unless composer || performer
  end
end
