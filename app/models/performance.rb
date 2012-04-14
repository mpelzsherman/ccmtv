class Performance < ActiveRecord::Base
  belongs_to :composition
  #has_one    :performer, :though => :composition
  belongs_to :performance_type
  belongs_to :person
  belongs_to :url
  has_and_belongs_to_many :urls
  scope :top10, limit(10)
  #has_many :performance_urls
  #has_many :urls, :through => :performances_urls
end
