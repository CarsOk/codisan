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

ActiveRecord::Schema[7.0].define(version: 2022_06_29_042408) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "name_course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_matters", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "matter_id", null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.index ["course_id", "user_id"], name: "index_courses_users_on_course_id_and_user_id", unique: true
  end

  create_table "fault_observers", force: :cascade do |t|
    t.text "description"
    t.bigint "observer_id", null: false
    t.bigint "fault_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fault_id"], name: "index_fault_observers_on_fault_id"
    t.index ["observer_id"], name: "index_fault_observers_on_observer_id"
  end

  create_table "faults", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.string "sanction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.string "city"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "matters", force: :cascade do |t|
    t.string "name_matter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "qualification"
    t.bigint "matter_id", null: false
    t.bigint "student_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_notes_on_course_id"
    t.index ["matter_id"], name: "index_notes_on_matter_id"
    t.index ["student_id"], name: "index_notes_on_student_id"
    t.index ["task_id"], name: "index_notes_on_task_id"
    t.index ["teacher_id"], name: "index_notes_on_teacher_id"
  end

  create_table "observers", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_observers_on_student_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "name_photo"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name_activity"
    t.text "description_activity"
    t.bigint "matter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matter_id"], name: "index_tasks_on_matter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type_document", null: false
    t.string "first_name", null: false
    t.string "first_last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "phone_number", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "second_name"
    t.string "second_last_name"
    t.string "document"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fault_observers", "faults"
  add_foreign_key "fault_observers", "observers"
  add_foreign_key "notes", "courses"
  add_foreign_key "notes", "matters"
  add_foreign_key "notes", "users", column: "student_id"
  add_foreign_key "notes", "users", column: "teacher_id"
  add_foreign_key "observers", "users", column: "student_id"
  add_foreign_key "tasks", "matters"
end
