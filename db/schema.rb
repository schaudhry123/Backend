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

ActiveRecord::Schema.define(version: 20141115044846) do

  create_table "athletes", force: true do |t|
    t.integer  "listener_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "athletes", ["listener_id"], name: "index_athletes_on_listener_id"

  create_table "devices", force: true do |t|
    t.integer  "athlete_id"
    t.string   "udid"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "devices", ["athlete_id"], name: "index_devices_on_athlete_id"
  add_index "devices", ["program_id"], name: "index_devices_on_program_id"

  create_table "impacts", force: true do |t|
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.float    "xaccel"
    t.float    "yaccel"
    t.float    "zaccel"
    t.datetime "timelog"
    t.integer  "athlete_id"
    t.integer  "concussedstatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "impacts", ["athlete_id"], name: "index_impacts_on_athlete_id"

  create_table "listeners", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "permissionprofile_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "listeners", ["permissionprofile_id"], name: "index_listeners_on_permissionprofile_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permission_profiles", force: true do |t|
    t.boolean  "canWrite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.integer  "sport_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "programs", ["organization_id"], name: "index_programs_on_organization_id"
  add_index "programs", ["sport_id"], name: "index_programs_on_sport_id"

  create_table "sports", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
