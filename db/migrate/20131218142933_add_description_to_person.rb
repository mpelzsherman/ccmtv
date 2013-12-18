class AddDescriptionToPerson < ActiveRecord::Migration
  def change
    add_column :people, :description, :text
  end
end
