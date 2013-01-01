class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :canonical_name
      t.string :first_name
      t.string :last_name
      t.string :stage_name
      t.boolean :composer, :default => false, :null => false
      t.boolean :performer, :default => false, :null => false
      t.date :date_of_birth
      t.integer :birth_country_id
      t.string :place_of_birth
      t.date :date_of_death
      t.string :place_of_death
      t.integer :death_country_id
      t.string :wikipedia_url
      t.string :website_url
      t.datetime :created_on
      t.datetime :updated_on
    end
  end
end
