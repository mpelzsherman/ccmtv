class CreateAdminCompositions < ActiveRecord::Migration
  def change
    create_table :admin_compositions do |t|
      t.integer :title_id
      t.string :title
      t.string :comp_group
      t.string :movement_name
      t.string :movement_num
      t.string :catalog_num1
      t.string :catalog_num2
      t.string :catalog_num3
      t.string :year_composed_begin
      t.string :year_composed_end
      t.integer :musical_key_id
      t.integer :person_id
      t.float :rating
      t.integer :rank
      t.integer :views

      t.timestamps
    end
  end
end
