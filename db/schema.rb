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
    t.bigint "requirement_id", comment: "要件ID"
    t.string "title", null: false, comment: "タイトル"
    t.string "leader_name", null: false, comment: "リーダー名"
    t.integer "amount", null: false, comment: "金額"
    t.boolean "is_secret", default: false, null: false, comment: "機密フラグ"
    t.text "suggestion_summary", null: false, comment: "提案骨子"
    t.text "suggestion_detail", null: false, comment: "解決提案詳細"
    t.string "comment", comment: "コメント"
    t.datetime "started_at", comment: "開始日時"
    t.datetime "ended_at", comment: "終了日時"
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
    t.string "title", null: false, comment: "問題タイトル"
    t.text "problem", null: false, comment: "問題点"
    t.text "solution", null: false, comment: "解決案"
    t.text "reference_link", comment: "参照リンク"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false, comment: "サービス名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false, comment: "使用技術名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false, comment: "ユーザー名"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "encrypted_password", null: false, comment: "暗号化済パスワード"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", comment: "プロバイダー名"
    t.string "uid", comment: "ユーザー識別用文字列"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_services", "activities"
  add_foreign_key "activity_services", "services"
end
