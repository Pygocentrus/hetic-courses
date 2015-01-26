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

ActiveRecord::Schema.define(version: 20141210232346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "courses", force: true do |t|
    t.string   "title",            null: false
    t.text     "description",      null: false
    t.string   "level"
    t.string   "location"
    t.string   "video_link"
    t.string   "slideshare_link"
    t.string   "image_link"
    t.integer  "categorie_id"
    t.integer  "user_id"
    t.integer  "participation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
    t.string   "duration"
    t.string   "slug"
  end

  create_table "like", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participations", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.date     "date"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "batch"
    t.text     "short_bio"
    t.string   "avatar"
    t.string   "personal_link"
    t.string   "role"
    t.string   "city"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
