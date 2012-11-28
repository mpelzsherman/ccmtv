class MusicalKey < ActiveRecord::Base
  has_many :compositions

  def name
    key_name
  end

end
