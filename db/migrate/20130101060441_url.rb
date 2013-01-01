class Url < ActiveRecord::Migration
  def change
    create_table "urls", :force => true do |t|
      t.string  "anchor_text",   :limit => 32,   :null => false
      t.string  "http",          :limit => 1024, :null => false
      t.string  "embeded_code",  :limit => 2048
      t.integer "url_type_id"
      t.date    "last_verified"
    end

    add_index "urls", ["url_type_id"], :name => "url_url_type_id_idx"
  end
end
