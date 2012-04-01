class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :canonical_name
      t.boolean :composer
      t.boolean :performer
      t.date :date_of_birth
      t.integer :birth_location_id
      t.integer :death_location_id
      t.date :date_of_death
      t.integer :current_location_id
      t.boolean :published, :default => true, :null => false
      t.datetime :created_on
      t.datetime :updated_on
    end
  end
end
