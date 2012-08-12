class Epithet < ActiveRecord::Base
  belongs_to :person
  belongs_to :language

  def canonical
    pre_canon = [title, forename, middle_name, prefix, surname, suffix].compact
    pre_canon << "(#{stage_name})" unless stage_name.blank?
    pre_canon.join ' '
  end
end
