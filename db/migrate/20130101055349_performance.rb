class Performance < ActiveRecord::Migration
  def change
    create_table "performances", :force => true do |t|
      t.integer "composition_id", :null => false
      t.integer "performance_type_id", :null => false
      t.integer "url_id"
      t.integer "person_id", :null => false
      t.integer "perf_year"
      t.text    "notes", :limit => 16777215
      t.float   "rating", :limit => 3
      t.integer "rank", :default => 0
      t.integer "views", :default => 0
      t.date    "created_on"
      t.date    "updated_on"
    end

    add_index "performances", ["composition_id"], :name => "performance_composition_id_idx"
    add_index "performances", ["performance_type_id"], :name => "performance_performance_type_id_idx"
    add_index "performances", ["person_id"], :name => "performance_person_id_idx"
    add_index "performances", ["url_id"], :name => "performance_url_id_idx"
  end
end
