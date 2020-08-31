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

ActiveRecord::Schema.define(version: 2020_08_31_080845) do

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

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "full_name"
    t.string "rpps_number"
    t.string "speciality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.string "drugs_class"
    t.string "family"
    t.string "action"
    t.string "galenic"
    t.string "posology"
    t.string "recommandations"
    t.integer "availability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "administration"
    t.string "commercialisation"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.string "sender_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "patient_drugs", force: :cascade do |t|
    t.string "disease"
    t.bigint "drug_id"
    t.bigint "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drug_id"], name: "index_patient_drugs_on_drug_id"
    t.index ["patient_id"], name: "index_patient_drugs_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "age"
    t.string "city"
    t.string "chronic_disease"
    t.bigint "doctor_id"
    t.bigint "pharma_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
    t.index ["pharma_id"], name: "index_patients_on_pharma_id"
  end

  create_table "pharmas", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "pharma_id"
    t.bigint "drug_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drug_id"], name: "index_stocks_on_drug_id"
    t.index ["pharma_id"], name: "index_stocks_on_pharma_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "rpps_number"
    t.bigint "pharma_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["pharma_id"], name: "index_users_on_pharma_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "patient_drugs", "drugs"
  add_foreign_key "patient_drugs", "patients"
  add_foreign_key "patients", "doctors"
  add_foreign_key "patients", "pharmas"
  add_foreign_key "stocks", "drugs"
  add_foreign_key "stocks", "pharmas"
  add_foreign_key "users", "pharmas"
end
