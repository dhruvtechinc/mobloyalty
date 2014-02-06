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

ActiveRecord::Schema.define(version: 20140206023256) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.string   "user_id"
    t.string   "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["user_id", "store_id"], name: "index_memberships_on_user_id_and_store_id", unique: true

  create_table "rewards", force: true do |t|
    t.string   "membership_id"
    t.string   "receipt_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.integer  "accrued"
    t.integer  "redeemed"
  end

  create_table "stores", force: true do |t|
    t.integer  "user_id"
    t.string   "store_number"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "store_phone_number"
    t.string   "store_logo"
  end

  add_index "stores", ["user_id", "store_number", "created_at"], name: "index_stores_on_user_id_and_store_number_and_created_at"

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "remember_token"
    t.boolean  "customer_account",        default: true
    t.boolean  "merchant_account",        default: false
    t.string   "initial_signup_store_id"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
