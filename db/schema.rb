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

ActiveRecord::Schema.define(version: 20160723112349) do

  create_table "conditions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dkind_id"
    t.integer  "val"
    t.datetime "record_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "conditions", ["dkind_id"], name: "index_conditions_on_dkind_id"
  add_index "conditions", ["user_id"], name: "index_conditions_on_user_id"

  create_table "dkinds", force: :cascade do |t|
    t.integer "seq"
    t.string  "jp"
    t.string  "en"
    t.string  "unit"
  end

  create_table "user_dkinds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dkind_id"
    t.float    "target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_dkinds", ["dkind_id"], name: "index_user_dkinds_on_dkind_id"
  add_index "user_dkinds", ["user_id"], name: "index_user_dkinds_on_user_id"

  create_table "user_infos", force: :cascade do |t|
    t.integer "seq"
    t.integer "user_id"
    t.string  "sex"
    t.integer "age"
    t.date    "birthday"
  end

  add_index "user_infos", ["user_id"], name: "index_user_infos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.integer  "seq"
    t.string   "code"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.datetime "login_at"
    t.datetime "logout_at"
  end

  add_index "users", ["email", "code"], name: "index_users_on_email_and_code", unique: true

end
