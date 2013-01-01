class Composition < ActiveRecord::Migration
  def change
    create_table "compositions", :force => true do |t|
      t.string  "title"
      t.string  "comp_group",          :limit => 64
      t.string  "movement_name",       :limit => 64
      t.integer "movement_num",        :limit => 1
      t.string  "catalog_num1",        :limit => 64
      t.string  "catalog_num2",        :limit => 64
      t.string  "catalog_num3",        :limit => 64
      t.integer "year_composed_begin", :limit => 2
      t.integer "year_composed_end",   :limit => 2
      t.integer "person_id",           :null => false
      t.float   "rating",              :limit => 3
      t.integer "rank",                :default => 0
      t.integer "views",               :default => 0
      t.date    "created_on"
      t.date    "updated_on"
    end

    add_index "compositions", ["comp_group"], :name => "comp_group_idx"
    add_index "compositions", ["person_id"], :name => "comp_person_id_idx"
    add_index "compositions", ["title"], :name => "index_title_on_compositions"
  end
end
