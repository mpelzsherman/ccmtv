class Url < ActiveRecord::Base
  validates :anchor_text, :presence => true
  validates :http, :presence => true
  validates :embeded_code, :presence => true
end
