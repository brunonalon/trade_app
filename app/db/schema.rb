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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160224212947) do
=======
ActiveRecord::Schema.define(version: 20160224175306) do
>>>>>>> origin/items-features

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "dislikes", force: true do |t|
    t.integer  "item_offered_id"
    t.integer  "item_disliked_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

=======
>>>>>>> origin/items-features
  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "picture_url"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "item_offered_id"
<<<<<<< HEAD
    t.integer  "item_liked_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "item_offered_id"
    t.integer  "item_liked_id"
=======
    t.integer  "item_like_id"
>>>>>>> origin/items-features
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "text"
    t.integer  "user_sender_id"
    t.integer  "user_receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "picture_profile_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.float    "longitude"
    t.float    "latitude"
  end

end
