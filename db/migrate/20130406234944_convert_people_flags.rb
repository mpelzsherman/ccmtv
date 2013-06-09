class ConvertPeopleFlags < ActiveRecord::Migration
  def up
    add_column :people, :person_type, :string
    execute "update people set person_type = 'performer' where performer = 1"
    execute "update people set person_type = 'composer' where composer = 1"
    remove_column :people, :performer
    remove_column :people, :composer
  end
end
