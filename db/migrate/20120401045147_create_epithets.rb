class CreateEpithets < ActiveRecord::Migration
  def change
    create_table :epithets do |t|
      t.integer :person_id
      t.integer :language_id
      t.string :title
      t.string :forename
      t.string :middle_name
      t.string :prefix
      t.string :surname
      t.string :suffix
      t.string :stage_name
      t.datetime :created_on
      t.datetime :updated_on
    end
  end
end
