class Url < ActiveRecord::Base
  validates :http, :presence => true
  validates :embeded_code, :presence => true
end
