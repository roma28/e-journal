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

ActiveRecord::Schema.define(version: 20150605164910) do

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "mother_name"
    t.string   "mother_email"
    t.string   "mother_job"
    t.string   "mother_occupation"
    t.string   "mother_telephone"
    t.string   "mother_education"
    t.string   "father_name"
    t.string   "father_email"
    t.string   "father_job"
    t.string   "father_occupation"
    t.string   "father_telephone"
    t.string   "father_education"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
