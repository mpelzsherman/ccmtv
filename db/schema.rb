# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120825203946) do

  create_table "compositions", :force => true do |t|
    t.integer "title_id"
    t.string  "title"
    t.string  "comp_group",          :limit => 64
    t.string  "movement_name",       :limit => 64
    t.integer "movement_num",        :limit => 1
    t.string  "catalog_num1",        :limit => 64
    t.string  "catalog_num2",        :limit => 64
    t.string  "catalog_num3",        :limit => 64
    t.integer "year_composed_begin", :limit => 2
    t.integer "year_composed_end",   :limit => 2
    t.integer "musical_key_id"
    t.integer "person_id",                                        :null => false
    t.float   "rating",              :limit => 3
    t.integer "rank",                              :default => 0
    t.integer "views",                             :default => 0
    t.date    "created_on"
    t.date    "updated_on"
  end

  add_index "compositions", ["comp_group"], :name => "comp_group_idx"
  add_index "compositions", ["musical_key_id"], :name => "comp_musical_key_id_idx"
  add_index "compositions", ["person_id"], :name => "comp_person_id_idx"
  add_index "compositions", ["title"], :name => "index_title_on_compositions"
  add_index "compositions", ["title_id"], :name => "comp_comp_name_idx"

  create_table "compositions_urls", :force => true do |t|
    t.integer "composition_id"
    t.integer "url_id"
  end

  add_index "compositions_urls", ["composition_id"], :name => "comp_url_comp_id_idx"
  add_index "compositions_urls", ["url_id"], :name => "comp_url_url_id_idx"

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "epithets", :force => true do |t|
    t.integer  "person_id"
    t.integer  "language_id"
    t.string   "title"
    t.string   "forename"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "surname"
    t.string   "suffix"
    t.string   "stage_name"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "languages", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "code2"
    t.integer "language_id"
    t.integer "parent_id"
    t.date    "created_on"
  end

  add_index "languages", ["name"], :name => "index_languages_name", :unique => true

  create_table "locations", :force => true do |t|
    t.string  "name"
    t.integer "region_id"
  end

  add_index "locations", ["region_id"], :name => "location_region_id_idx"

  create_table "musical_keys", :force => true do |t|
    t.string "key_name",       :limit => 24, :null => false
    t.string "short_key_name", :limit => 2,  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "canonical_name"
    t.boolean  "composer",            :default => false, :null => false
    t.boolean  "performer",           :default => false, :null => false
    t.date     "date_of_birth"
    t.integer  "birth_location_id"
    t.integer  "death_location_id"
    t.date     "date_of_death"
    t.integer  "current_location_id"
    t.boolean  "published",           :default => true,  :null => false
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "performance_types", :force => true do |t|
    t.string "name"
  end

  create_table "performances", :force => true do |t|
    t.integer "composition_id",                                         :null => false
    t.integer "performance_type_id",                                    :null => false
    t.integer "url_id"
    t.integer "person_id",                                              :null => false
    t.integer "perf_year"
    t.text    "notes",               :limit => 16777215
    t.float   "rating",              :limit => 3
    t.integer "rank",                                    :default => 0
    t.integer "views",                                   :default => 0
    t.date    "created_on"
    t.date    "updated_on"
  end

  add_index "performances", ["composition_id"], :name => "performance_composition_id_idx"
  add_index "performances", ["performance_type_id"], :name => "performance_performance_type_id_idx"
  add_index "performances", ["person_id"], :name => "performance_person_id_idx"
  add_index "performances", ["url_id"], :name => "performance_url_id_idx"

  create_table "regions", :force => true do |t|
    t.string  "name"
    t.integer "country_id", :null => false
  end

  add_index "regions", ["country_id"], :name => "regions_country_id_idx"
  add_index "regions", ["name"], :name => "region_region_name_idx"

  create_table "titles", :force => true do |t|
    t.integer "composition_id",                  :null => false
    t.string  "composition_name", :limit => 128, :null => false
  end

  add_index "titles", ["composition_id"], :name => "comp_name_comp_id_idx"

  create_table "urls", :force => true do |t|
    t.string  "anchor_text",   :limit => 32,   :null => false
    t.string  "http",          :limit => 1024, :null => false
    t.string  "embeded_code",  :limit => 2048
    t.integer "url_type_id"
    t.date    "last_verified"
  end

  add_index "urls", ["url_type_id"], :name => "url_url_type_id_idx"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "active",                 :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
