class Person < ActiveRecord::Base
  EARLIEST_YEAR = 1500

  belongs_to :birth_country, :class_name => 'Country'
  belongs_to :death_country, :class_name => 'Country'

  scope :composers,         where(:composer => true)
  scope :pianists,          where(:performer => true)
  scope :top10,             limit(10)
  scope :by_canonical_name, order(:canonical_name)

  validates :canonical_name, :uniqueness => true, :presence => true, :length => {  :within => 2..200 }
  validate  :categorised?

  def rank
    I18n.t(:na)
  end

  def views
    I18n.t(:na)
  end

  def self.search params={}
    skope = scoped
    skope = skope.where(:composer  => params[:composer]=='1')  unless params[:composer].blank?
    skope = skope.where(:performer => params[:performer]=='1') unless params[:performer].blank?
    skope = skope.where(["canonical_name like ?", '%'+params[:canonical_name].downcase+'%']) unless params[:canonical_name].blank?
    skope
  end

  private

  def categorised?
    errors[:base] << I18n.t(:either_composer_or_performer) unless composer || performer
  end
end
