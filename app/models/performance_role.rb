class PerformanceRole < ActiveRecord::Base
  attr_accessible :performance_id, :person_id, :role_name
  belongs_to :performance
  belongs_to :person
end
