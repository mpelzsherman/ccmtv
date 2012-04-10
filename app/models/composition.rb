class Composition < ActiveRecord::Base
  belongs_to :person

  def composer
    self.person
  end

end
