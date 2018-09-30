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

ActiveRecord::Schema.define(version: 2018_09_30_141935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.json "total_hours"
    t.json "student_hours"
    t.json "percentage"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.datetime "date"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "occasion"
    t.index ["admin_id"], name: "index_holidays_on_admin_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.string "reason"
    t.datetime "date"
    t.integer "weekday"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_leaves_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "roll_no"
    t.string "admission_no"
    t.string "ktu_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_students_on_admin_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_subjects_on_admin_id"
  end

  create_table "time_tables", force: :cascade do |t|
    t.json "table"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_time_tables_on_admin_id"
  end

  create_table "working_days", force: :cascade do |t|
    t.datetime "date"
    t.integer "weekday"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_working_days_on_admin_id"
  end

  add_foreign_key "attendances", "students"
  add_foreign_key "holidays", "admins"
  add_foreign_key "leaves", "students"
  add_foreign_key "subjects", "admins"
  add_foreign_key "time_tables", "admins"
  add_foreign_key "working_days", "admins"
end
