class Performance < ActiveRecord::Base
  belongs_to :composition
  belongs_to :performance_type
  belongs_to :person
  belongs_to :url
  has_and_belongs_to_many :urls
  #has_many :performance_urls
  #has_many :urls, :through => :performances_urls
end
