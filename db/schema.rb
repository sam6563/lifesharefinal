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

ActiveRecord::Schema.define(version: 20170417102120) do

  create_table "donors", force: :cascade do |t|
    t.string   "name"
    t.string   "blood_group"
    t.date     "dob"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "last_blood_donated"
    t.string   "contact_number"
    t.string   "email_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  add_index "donors", ["user_id"], name: "index_donors_on_user_id"

  create_table "receivers", force: :cascade do |t|
    t.string   "name"
    t.string   "blood_group"
    t.date     "dob"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "contact_number"
    t.string   "email_id"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "receivers", ["user_id"], name: "index_receivers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "otp_auth_secret"
    t.string   "otp_recovery_secret"
    t.boolean  "otp_enabled",            default: false, null: false
    t.boolean  "otp_mandatory",          default: false, null: false
    t.datetime "otp_enabled_on"
    t.integer  "otp_failed_attempts",    default: 0,     null: false
    t.integer  "otp_recovery_counter",   default: 0,     null: false
    t.string   "otp_persistence_seed"
    t.string   "otp_session_challenge"
    t.datetime "otp_challenge_expires"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["otp_challenge_expires"], name: "index_users_on_otp_challenge_expires"
  add_index "users", ["otp_session_challenge"], name: "index_users_on_otp_session_challenge", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
