class Url < ActiveRecord::Base
  validates :http, :presence => true, :uniqueness => true
  validates :embeded_code, :presence => true
end
