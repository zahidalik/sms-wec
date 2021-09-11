# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_11_142004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "designations", force: :cascade do |t|
    t.string "designable_type", null: false
    t.bigint "designable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "charge"
    t.index ["designable_type", "designable_id"], name: "index_designations_on_designable_type_and_designable_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "mttc_students", force: :cascade do |t|
    t.string "username"
    t.string "full_name"
    t.date "d_o_b"
    t.string "father"
    t.string "mother"
    t.string "religion"
    t.string "status_of_father_and_mother"
    t.string "contact_of_father"
    t.string "contact_of_mother"
    t.string "address"
    t.date "admission_date"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mttc_subjects", force: :cascade do |t|
    t.string "name"
    t.integer "credits"
    t.float "hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "book"
  end

  create_table "mttc_subjects_pools", force: :cascade do |t|
    t.string "term"
    t.string "academic_year"
    t.date "beginning_date"
    t.date "ending_date"
    t.time "lesson_time"
    t.string "lesson_days"
    t.string "class_room"
    t.bigint "mttc_subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mttc_subject_id"], name: "index_mttc_subjects_pools_on_mttc_subject_id"
  end

  create_table "mttc_users", force: :cascade do |t|
    t.string "username"
    t.string "full_name"
    t.string "email"
    t.string "mobile"
    t.string "address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_mttc_users_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "head"
    t.string "deputy_head"
    t.string "academic_head"
    t.string "assistant_a_h"
    t.string "islamic_deputy"
    t.string "environment_incharge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_schools_on_slug", unique: true
  end

  create_table "standards", force: :cascade do |t|
    t.string "name"
    t.string "section"
    t.string "class_teacher"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["school_id"], name: "index_standards_on_school_id"
    t.index ["slug"], name: "index_standards_on_slug", unique: true
  end

  create_table "student_schools", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_student_schools_on_school_id"
    t.index ["student_id"], name: "index_student_schools_on_student_id"
  end

  create_table "student_standard_academic_years", force: :cascade do |t|
    t.string "year"
    t.bigint "student_id", null: false
    t.bigint "standard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["standard_id"], name: "index_student_standard_academic_years_on_standard_id"
    t.index ["student_id"], name: "index_student_standard_academic_years_on_student_id"
  end

  create_table "student_subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "student_standard_academic_year_id", null: false
    t.bigint "user_standard_academic_year_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_standard_academic_year_id"], name: "index_student_subjects_on_student_standard_academic_year_id"
    t.index ["user_standard_academic_year_id"], name: "index_student_subjects_on_user_standard_academic_year_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "contact"
    t.string "address"
    t.string "father"
    t.string "mother"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "slug"
    t.string "avatar"
    t.index ["slug"], name: "index_students_on_slug", unique: true
    t.index ["username"], name: "index_students_on_username", unique: true
  end

  create_table "user_schools", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_user_schools_on_school_id"
    t.index ["user_id"], name: "index_user_schools_on_user_id"
  end

  create_table "user_standard_academic_years", force: :cascade do |t|
    t.string "year"
    t.bigint "user_id", null: false
    t.bigint "standard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_user_standard_academic_years_on_slug", unique: true
    t.index ["standard_id"], name: "index_user_standard_academic_years_on_standard_id"
    t.index ["user_id"], name: "index_user_standard_academic_years_on_user_id"
  end

  create_table "user_subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "user_standard_academic_year_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_standard_academic_year_id"], name: "index_user_subjects_on_user_standard_academic_year_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "mobile"
    t.string "address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "slug"
    t.string "avatar"
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "mttc_subjects_pools", "mttc_subjects"
  add_foreign_key "standards", "schools"
  add_foreign_key "student_schools", "schools"
  add_foreign_key "student_schools", "students"
  add_foreign_key "student_standard_academic_years", "standards"
  add_foreign_key "student_standard_academic_years", "students"
  add_foreign_key "student_subjects", "student_standard_academic_years"
  add_foreign_key "student_subjects", "user_standard_academic_years"
  add_foreign_key "user_schools", "schools"
  add_foreign_key "user_schools", "users"
  add_foreign_key "user_standard_academic_years", "standards"
  add_foreign_key "user_standard_academic_years", "users"
  add_foreign_key "user_subjects", "user_standard_academic_years"
end
