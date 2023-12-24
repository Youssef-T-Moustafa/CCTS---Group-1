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

ActiveRecord::Schema[7.1].define(version: 2023_12_24_031524) do
  create_table "activities", force: :cascade do |t|
    t.string "activity_title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.decimal "requested_budget"
    t.integer "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.json "media"
    t.index ["club_id"], name: "index_activities_on_club_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_attendances_on_activity_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "club_advisors", force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_advisors_on_club_id"
    t.index ["staff_id"], name: "index_club_advisors_on_staff_id"
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
    t.string "category"
  end

  create_table "extra_activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "student_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "evidence"
    t.index ["student_id"], name: "index_extra_activities_on_student_id"
  end

  create_table "form_capacities", force: :cascade do |t|
    t.integer "club_id"
    t.integer "f1"
    t.integer "f2"
    t.integer "f3"
    t.integer "f4"
    t.integer "f5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_form_capacities_on_club_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_histories", force: :cascade do |t|
    t.integer "inventory_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_inventory_histories_on_inventory_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_activities", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_staff_activities_on_activity_id"
    t.index ["staff_id"], name: "index_staff_activities_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "parent_phone"
    t.string "parent_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "score", default: 0
    t.string "stud_id"
    t.integer "form"
  end

  add_foreign_key "activities", "clubs"
  add_foreign_key "attendances", "activities"
  add_foreign_key "attendances", "students"
  add_foreign_key "club_advisors", "clubs"
  add_foreign_key "club_advisors", "staffs"
  add_foreign_key "club_members", "clubs"
  add_foreign_key "club_members", "students"
  add_foreign_key "extra_activities", "students"
  add_foreign_key "form_capacities", "clubs"
  add_foreign_key "inventory_histories", "inventories"
  add_foreign_key "staff_activities", "activities"
  add_foreign_key "staff_activities", "staffs"
end
