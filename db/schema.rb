# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_08_023834) do
  create_table "activities", force: :cascade do |t|
    t.string "activity_title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.decimal "allocated_budget"
    t.integer "club_id", null: false
    t.string "achievement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_activities_on_club_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_attendances_on_activity_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "club_members", force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_members_on_club_id"
    t.index ["student_id"], name: "index_club_members_on_student_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "budget"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "student_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_extra_activities_on_student_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "parent_phone"
    t.string "student_number"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "clubs"
  add_foreign_key "attendances", "activities"
  add_foreign_key "attendances", "students"
  add_foreign_key "club_members", "clubs"
  add_foreign_key "club_members", "students"
  add_foreign_key "extra_activities", "students"
end
