class CreateLanguages < ActiveRecord::Migration
  def change
    create_table "languages" do |t|
      t.string  "name", :null => false
      t.string  "code2"
      t.integer "language_id"
      t.integer "parent_id"
      t.date "created_on"
    end

    add_index "languages", ["name"], :name => "index_languages_name", :unique => true
  end
end
