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

ActiveRecord::Schema.define(version: 20160808214727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gist_labels", force: :cascade do |t|
    t.string   "gist_id"
    t.integer  "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gist_labels", ["gist_id", "label_id"], name: "index_gist_labels_on_gist_id_and_label_id", unique: true, using: :btree
  add_index "gist_labels", ["gist_id"], name: "index_gist_labels_on_gist_id", using: :btree
  add_index "gist_labels", ["label_id"], name: "index_gist_labels_on_label_id", using: :btree

  create_table "labels", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "labels", ["name"], name: "index_labels_on_name", using: :btree
  add_index "labels", ["user_id", "name"], name: "index_labels_on_user_id_and_name", unique: true, using: :btree
  add_index "labels", ["user_id"], name: "index_labels_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "sign_in_count",      default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
  end

  add_index "users", ["provider", "token"], name: "index_users_on_provider_and_token", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "gist_labels", "labels"
  add_foreign_key "labels", "users"
end
