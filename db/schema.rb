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

ActiveRecord::Schema.define(version: 20140304172521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.integer  "gym_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "machine_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_executions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "session_id"
    t.integer  "exercise_id"
    t.integer  "percentage"
    t.integer  "reps"
    t.string   "time"
    t.decimal  "weight"
  end

  create_table "exercises", force: true do |t|
    t.boolean  "weight"
    t.boolean  "percentage"
    t.boolean  "reps"
    t.boolean  "time"
    t.boolean  "seat"
    t.boolean  "foot"
    t.boolean  "degrees"
    t.boolean  "back"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "foot_stool", default: false
    t.boolean  "pin",        default: false
    t.boolean  "arm",        default: false
    t.boolean  "seatbelt",   default: false
    t.boolean  "backpad",    default: false
    t.boolean  "knee",       default: false
    t.boolean  "seatpad",    default: false
    t.boolean  "chestpad",   default: false
    t.boolean  "hips",       default: false
    t.boolean  "leg",        default: false
    t.integer  "gym_id"
    t.string   "category"
  end

  create_table "exercises_gyms", id: false, force: true do |t|
    t.integer "exercise_id", null: false
    t.integer "gym_id",      null: false
  end

  create_table "exercises_routines", id: false, force: true do |t|
    t.integer "exercise_id", null: false
    t.integer "routine_id",  null: false
  end

  create_table "gyms", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

  add_index "gyms", ["email"], name: "index_gyms_on_email", unique: true, using: :btree
  add_index "gyms", ["reset_password_token"], name: "index_gyms_on_reset_password_token", unique: true, using: :btree

  create_table "notes", force: true do |t|
    t.integer  "client_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routines", force: true do |t|
    t.text     "description"
    t.integer  "gym_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_routines", force: true do |t|
    t.integer  "routine_id"
    t.integer  "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "name"
    t.string   "client_id_string"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "routine_id"
    t.date     "date"
    t.integer  "client_id"
  end

  create_table "setting_executions", force: true do |t|
    t.string   "seat"
    t.string   "foot"
    t.string   "degrees"
    t.string   "back"
    t.integer  "exercise_id"
    t.string   "foot_stool"
    t.string   "pin"
    t.string   "arm"
    t.string   "seatbelt"
    t.string   "backpad"
    t.string   "knee"
    t.string   "seatpad"
    t.string   "chestpad"
    t.string   "hips"
    t.string   "leg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "session_id"
  end

end
