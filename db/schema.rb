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

ActiveRecord::Schema.define(version: 20131220065109) do

  create_table "campuses", force: true do |t|
    t.integer  "school_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campuses", ["school_id", "city_id"], name: "index_campuses_on_school_id_and_city_id", unique: true

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "abbrev"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["abbrev"], name: "index_cities_on_abbrev", unique: true
  add_index "cities", ["name"], name: "index_cities_on_name", unique: true

  create_table "cohorts", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "school_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cohorts", ["end_date"], name: "index_cohorts_on_end_date"
  add_index "cohorts", ["start_date", "end_date"], name: "index_cohorts_on_start_date_and_end_date"
  add_index "cohorts", ["start_date"], name: "index_cohorts_on_start_date"

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["name"], name: "index_schools_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.integer  "cohort_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
    t.string   "lname"
    t.string   "linkedin_token"
    t.string   "password_digest"
  end

  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
