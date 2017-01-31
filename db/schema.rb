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

ActiveRecord::Schema.define(version: 20170107034618) do

  create_table "accepteds", force: :cascade do |t|
    t.string   "name"
    t.string   "apellidoPaterno"
    t.string   "apellidoMaterno"
    t.decimal  "examMark"
    t.decimal  "schoolAverage"
    t.string   "speciality"
    t.string   "secondSpeciality"
    t.string   "finalSpeciality"
    t.string   "turn"
    t.string   "group"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "allaccepteds", force: :cascade do |t|
    t.string   "name"
    t.string   "apellidoPaterno"
    t.string   "apellidoMaterno"
    t.decimal  "examMark"
    t.decimal  "schoolAverage"
    t.boolean  "isForeign"
    t.string   "speciality"
    t.string   "secondSpeciality"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "apellidoPaterno"
    t.string   "apellidoMaterno"
    t.decimal  "examMark"
    t.decimal  "schoolAverage"
    t.boolean  "isForeign"
    t.string   "speciality"
    t.string   "secondSpeciality"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "morningTurn"
    t.boolean  "eveningTurn"
    t.integer  "morningClasses"
    t.integer  "eveningClasses"
    t.integer  "numberStudents"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
