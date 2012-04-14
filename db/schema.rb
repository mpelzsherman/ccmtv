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

ActiveRecord::Schema.define(:version => 20120408040702) do

  create_table "admin_compositions", :force => true do |t|
    t.integer  "title_id"
    t.string   "title"
    t.string   "comp_group"
    t.string   "movement_name"
    t.string   "movement_num"
    t.string   "catalog_num1"
    t.string   "catalog_num2"
    t.string   "catalog_num3"
    t.string   "year_composed_begin"
    t.string   "year_composed_end"
    t.integer  "musical_key_id"
    t.integer  "person_id"
    t.float    "rating"
    t.integer  "rank"
    t.integer  "views"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "admin_performances", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "locations", :force => true do |t|
    t.string  "name"
    t.integer "region_id"
  end

  add_index "locations", ["region_id"], :name => "location_region_id_idx"

  create_table "people", :force => true do |t|
    t.string   "canonical_name"
    t.boolean  "composer"
    t.boolean  "performer"
    t.date     "date_of_birth"
    t.integer  "birth_location_id"
    t.integer  "death_location_id"
    t.date     "date_of_death"
    t.integer  "current_location_id"
    t.boolean  "published",           :default => true, :null => false
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "regions", :force => true do |t|
    t.string  "name"
    t.integer "country_id", :null => false
  end

  add_index "regions", ["country_id"], :name => "regions_country_id_idx"
  add_index "regions", ["name"], :name => "region_region_name_idx"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
