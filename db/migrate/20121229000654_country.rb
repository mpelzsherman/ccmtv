class Country < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :null => false
    end
  end
end
