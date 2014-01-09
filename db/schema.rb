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

ActiveRecord::Schema.define(version: 20140109034459) do

  create_table "foods", force: true do |t|
    t.string   "name"
    t.integer  "producer_id"
    t.integer  "upc"
    t.decimal  "servings"
    t.decimal  "serving_size"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foods", ["name", "producer_id", "upc"], name: "index_foods_on_name_and_producer_id_and_upc", unique: true, using: :btree
  add_index "foods", ["producer_id"], name: "index_foods_on_producer_id", using: :btree
  add_index "foods", ["unit_id"], name: "index_foods_on_unit_id", using: :btree

  create_table "producers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producers", ["name"], name: "index_producers_on_name", unique: true, using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "stocks", force: true do |t|
    t.integer  "food_id"
    t.decimal  "price"
    t.decimal  "quantity"
    t.integer  "store_id"
    t.decimal  "discount"
    t.datetime "bought"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["food_id", "store_id", "bought", "user_id"], name: "index_stocks_on_food_id_and_store_id_and_bought_and_user_id", unique: true, using: :btree
  add_index "stocks", ["food_id"], name: "index_stocks_on_food_id", using: :btree
  add_index "stocks", ["store_id"], name: "index_stocks_on_store_id", using: :btree
  add_index "stocks", ["user_id"], name: "index_stocks_on_user_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["name"], name: "index_stores_on_name", unique: true, using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["name"], name: "index_units_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
