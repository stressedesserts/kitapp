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

ActiveRecord::Schema.define(version: 20161117222156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "bags", force: :cascade do |t|
    t.string   "adv"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "bags", ["user_id"], name: "index_bags_on_user_id", using: :btree

  create_table "essentials", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "essentials", ["tool_id"], name: "index_essentials_on_tool_id", using: :btree
  add_index "essentials", ["user_id"], name: "index_essentials_on_user_id", using: :btree

  create_table "tools", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "link"
    t.string   "description"
    t.string   "name"
  end

  add_index "tools", ["bag_id"], name: "index_tools_on_bag_id", using: :btree
  add_index "tools", ["user_id"], name: "index_tools_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "bag_id"
    t.string   "image"
    t.string   "avatar"
  end

  add_index "users", ["bag_id"], name: "index_users_on_bag_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bags", "users"
  add_foreign_key "essentials", "tools"
  add_foreign_key "essentials", "users"
  add_foreign_key "tools", "bags"
  add_foreign_key "tools", "users"
  add_foreign_key "users", "bags"
end
