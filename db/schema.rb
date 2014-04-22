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

ActiveRecord::Schema.define(version: 20140421204938) do

  create_table "admins", force: true do |t|
    t.string   "username",    limit: 30,                          null: false
    t.string   "password",                                        null: false
    t.string   "first_name",             default: "Unspecified."
    t.string   "last_name",              default: "Unspecified."
    t.string   "email",                  default: "Unspecified."
    t.integer  "num_of_tuts",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", using: :btree
  add_index "admins", ["username"], name: "index_admins_on_username", using: :btree

  create_table "admins_tutorials", id: false, force: true do |t|
    t.integer "admin_id"
    t.integer "tutorial_id"
  end

  add_index "admins_tutorials", ["admin_id", "tutorial_id"], name: "index_admins_tutorials_on_admin_id_and_tutorial_id", using: :btree

  create_table "course_enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "num_of_courses_prior", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_enrollments", ["user_id", "course_id"], name: "index_course_enrollments_on_user_id_and_course_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "course_name",        default: "New Course",                                            null: false
    t.string   "course_description", default: "An exciting description about an exciting new course!"
    t.integer  "num_of_tuts",        default: 0
    t.integer  "num_of_enrollments", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["course_description"], name: "index_courses_on_course_description", using: :btree
  add_index "courses", ["course_name"], name: "index_courses_on_course_name", using: :btree

  create_table "tutorials", force: true do |t|
    t.integer  "course_id",                                      null: false
    t.string   "tut_title",     default: "Tutorial title",       null: false
    t.string   "tut_content",   default: "Lots to learn about!", null: false
    t.string   "num_of_admins", default: "1",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tutorials", ["course_id"], name: "index_tutorials_on_course_id", using: :btree
  add_index "tutorials", ["tut_title"], name: "index_tutorials_on_tut_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",       limit: 30,                                 null: false
    t.string   "password",       limit: 45,                                 null: false
    t.string   "first_name",     limit: 30,                                 null: false
    t.string   "last_name",      limit: 30,                                 null: false
    t.string   "email",                     default: "example@example.com", null: false
    t.integer  "num_of_courses",            default: 0,                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
