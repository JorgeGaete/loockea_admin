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

ActiveRecord::Schema.define(version: 20140519054045) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "super_admin",     default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["remember_token"], name: "index_admins_on_remember_token"

  create_table "campanas", force: true do |t|
    t.integer  "contenido_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client"
    t.integer  "tipo"
    t.integer  "goal"
    t.integer  "status"
  end

  create_table "contenidos", force: true do |t|
    t.integer  "campana_id"
    t.string   "name"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.integer  "category_id"
    t.datetime "end_date"
    t.integer  "status"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  add_index "contenidos", ["campana_id", "created_at"], name: "index_contenidos_on_campana_id_and_created_at"

end
