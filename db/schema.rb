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

ActiveRecord::Schema[7.0].define(version: 2022_06_03_013914) do
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

  create_table "activities", force: :cascade do |t|
    t.bigint "requirement_id", comment: "??????ID"
    t.string "title", null: false, comment: "????????????"
    t.string "leader_name", null: false, comment: "???????????????"
    t.integer "amount", null: false, comment: "??????"
    t.boolean "is_secret", default: false, null: false, comment: "???????????????"
    t.text "suggestion_summary", null: false, comment: "????????????"
    t.text "suggestion_detail", null: false, comment: "??????????????????"
    t.string "comment", comment: "????????????"
    t.datetime "started_at", comment: "????????????"
    t.datetime "ended_at", comment: "????????????"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_services", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_services_on_activity_id"
    t.index ["service_id"], name: "index_activity_services_on_service_id"
  end

  create_table "problem_cases", force: :cascade do |t|
    t.string "title", null: false, comment: "??????????????????"
    t.text "problem", null: false, comment: "?????????"
    t.text "solution", null: false, comment: "?????????"
    t.text "reference_link", comment: "???????????????"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false, comment: "???????????????"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false, comment: "???????????????"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false, comment: "???????????????"
    t.string "email", null: false, comment: "?????????????????????"
    t.string "encrypted_password", null: false, comment: "???????????????????????????"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", comment: "?????????????????????"
    t.string "uid", comment: "??????????????????????????????"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_services", "activities"
  add_foreign_key "activity_services", "services"
end
