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

ActiveRecord::Schema.define(:version => 20130806193410) do

  create_table "boil_notes", :force => true do |t|
    t.integer  "brew_note_id"
    t.integer  "pre_boil_volume"
    t.integer  "post_boil_volume"
    t.text     "body"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "bottling_notes", :force => true do |t|
    t.integer  "brew_note_id"
    t.integer  "volume"
    t.string   "priming_sugar_type"
    t.integer  "priming_sugar_amount"
    t.text     "body"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "brew_notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.text     "body"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "beer_photo_file_name"
    t.string   "beer_photo_content_type"
    t.integer  "beer_photo_file_size"
    t.datetime "beer_photo_updated_at"
  end

  create_table "fermentation_checks", :force => true do |t|
    t.integer  "fermentation_note_id"
    t.integer  "temperature"
    t.integer  "specific_gravity"
    t.text     "body"
    t.integer  "elapsed_time"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "fermentation_notes", :force => true do |t|
    t.integer  "brew_note_id"
    t.integer  "volume"
    t.integer  "og"
    t.integer  "fg"
    t.text     "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mash_notes", :force => true do |t|
    t.integer  "brew_note_id"
    t.integer  "time"
    t.integer  "temperature"
    t.string   "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "xml"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
