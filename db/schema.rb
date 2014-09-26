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

ActiveRecord::Schema.define(version: 20140926051726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backs", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "project_id", null: false
    t.integer  "amount",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body",       null: false
    t.integer  "author_id",  null: false
    t.integer  "project_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", unique: true, using: :btree
  add_index "comments", ["project_id"], name: "index_comments_on_project_id", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.string   "title",                      null: false
    t.integer  "target_amount",              null: false
    t.date     "end_date",                   null: false
    t.integer  "category_id"
    t.integer  "creator_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "tag_id"
    t.string   "project_photo_file_name"
    t.string   "project_photo_content_type"
    t.integer  "project_photo_file_size"
    t.datetime "project_photo_updated_at"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["creator_id"], name: "index_projects_on_creator_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",            null: false
    t.string   "password_digest",     null: false
    t.string   "session_token",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avator_file_name"
    t.string   "avator_content_type"
    t.integer  "avator_file_size"
    t.datetime "avator_updated_at"
    t.text     "description"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
