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

ActiveRecord::Schema.define(version: 20140420113837) do

  create_table "administrators", force: true do |t|
    t.string   "username",   limit: 35,             null: false
    t.string   "password",   limit: 40,             null: false
    t.string   "first_name",                        null: false
    t.string   "last_name",                         null: false
    t.string   "email",                             null: false
    t.integer  "tutorials",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "biology_tutorials", force: true do |t|
    t.integer  "author_id",                  null: false
    t.string   "title"
    t.string   "permalink"
    t.text     "content",                    null: false
    t.boolean  "published",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "biology_tutorials", ["author_id"], name: "index_biology_tutorials_on_author_id", using: :btree
  add_index "biology_tutorials", ["title"], name: "index_biology_tutorials_on_title", using: :btree

  create_table "chemistry_tutorials", force: true do |t|
    t.integer  "author_id",                  null: false
    t.string   "title"
    t.string   "permalink"
    t.text     "content",                    null: false
    t.boolean  "published",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chemistry_tutorials", ["author_id"], name: "index_chemistry_tutorials_on_author_id", using: :btree
  add_index "chemistry_tutorials", ["title"], name: "index_chemistry_tutorials_on_title", using: :btree

  create_table "physics_tutorials", force: true do |t|
    t.integer  "author_id",                  null: false
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.boolean  "published",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "physics_tutorials", ["author_id"], name: "index_physics_tutorials_on_author_id", using: :btree
  add_index "physics_tutorials", ["title"], name: "index_physics_tutorials_on_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",                 null: false
    t.string   "last_name",                  null: false
    t.string   "username",                   null: false
    t.string   "password",                   null: false
    t.string   "email",                      null: false
    t.integer  "num_of_courses", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
