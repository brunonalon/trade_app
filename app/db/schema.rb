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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "community", force: true do |t|
    t.string "name", limit: nil
    t.string "city", limit: nil
  end

  create_table "item", force: true do |t|
    t.string  "name",        limit: nil
    t.text    "description"
    t.string  "picture_url", limit: nil
    t.integer "user_id"
  end

  create_table "like", force: true do |t|
    t.integer "item_offered_id"
    t.integer "item_like_id"
  end

  create_table "location", force: true do |t|
    t.integer "community_id"
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "message", force: true do |t|
    t.text    "text"
    t.integer "user_sender_id"
    t.integer "user_receiver_id"
  end

  create_table "user", force: true do |t|
    t.string "name",                limit: nil
    t.string "email",               limit: nil
    t.string "picture_profile_url", limit: nil
    t.text   "location_id"
  end

end
