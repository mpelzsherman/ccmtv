# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130101060441) do

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
    t.integer "person_id",                                        :null => false
    t.float   "rating"
    t.integer "rank",                              :default => 0
    t.integer "views",                             :default => 0
    t.date    "created_on"
    t.date    "updated_on"
  end

  add_index "compositions", ["comp_group"], :name => "comp_group_idx"
  add_index "compositions", ["person_id"], :name => "comp_person_id_idx"
  add_index "compositions", ["title"], :name => "index_title_on_compositions"

  create_table "countries", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "canonical_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "stage_name"
    t.boolean  "composer",         :default => false, :null => false
    t.boolean  "performer",        :default => false, :null => false
    t.date     "date_of_birth"
    t.integer  "birth_country_id"
    t.string   "place_of_birth"
    t.date     "date_of_death"
    t.string   "place_of_death"
    t.integer  "death_country_id"
    t.string   "wikipedia_url"
    t.string   "website_url"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "performances", :force => true do |t|
    t.integer "composition_id",                                           :null => false
    t.integer "performance_type_id",                                      :null => false
    t.integer "url_id"
    t.integer "person_id",                                                :null => false
    t.integer "perf_year"
    t.text    "notes",               :limit => 2147483647
    t.float   "rating"
    t.integer "rank",                                      :default => 0
    t.integer "views",                                     :default => 0
    t.date    "created_on"
    t.date    "updated_on"
  end

  add_index "performances", ["composition_id"], :name => "performance_composition_id_idx"
  add_index "performances", ["performance_type_id"], :name => "performance_performance_type_id_idx"
  add_index "performances", ["person_id"], :name => "performance_person_id_idx"
  add_index "performances", ["url_id"], :name => "performance_url_id_idx"

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
    t.boolean  "active",                 :default => false, :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
