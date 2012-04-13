class MusicalKey < ActiveRecord::Base
  has_many :compositions
end
