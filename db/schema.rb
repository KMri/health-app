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

ActiveRecord::Schema.define(version: 20160712113014) do

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
