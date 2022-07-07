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

ActiveRecord::Schema[7.0].define(version: 2022_07_07_063836) do
  create_table "blood_pressure_conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blood_pressures", force: :cascade do |t|
    t.integer "user_id"
    t.integer "blood_pressure_condition_id"
    t.integer "sistole"
    t.integer "diastole"
    t.integer "pulse"
    t.text "note"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "body_weight_heights", force: :cascade do |t|
    t.integer "user_id"
    t.float "weight"
    t.float "height"
    t.text "note"
    t.float "bmi_calculation"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_blood_glucose_conditions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tb_blood_glucose_conditions_on_name", unique: true
  end

  create_table "tb_blood_glucoses", force: :cascade do |t|
    t.string "blood_glucose", null: false
    t.string "note"
    t.datetime "date_time", null: false
    t.integer "user_id", null: false
    t.integer "blood_glucose_condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_blood_oxygen_conditions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tb_blood_oxygen_conditions_on_name", unique: true
  end

  create_table "tb_blood_oxygens", force: :cascade do |t|
    t.string "blood_oxygen", null: false
    t.string "note"
    t.datetime "date_time", null: false
    t.integer "user_id", null: false
    t.integer "blood_oxygen_condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_document_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_documents", force: :cascade do |t|
    t.string "doc_name"
    t.string "doc_upload"
    t.integer "user_id"
    t.integer "document_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_join_lab_measurements", force: :cascade do |t|
    t.string "value", null: false
    t.integer "measurement_id", null: false
    t.integer "result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_lab_measurements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_lab_result_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_lab_results", force: :cascade do |t|
    t.string "name"
    t.datetime "date_time"
    t.string "doc"
    t.string "result_note"
    t.integer "result_category_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tb_vaccine_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tb_vaccine_categories_on_name", unique: true
  end

  create_table "tb_vaccines", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vaccine_category_id", null: false
    t.string "name", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "birth_place"
    t.date "birth_date"
    t.string "blood_type"
    t.string "bpjs_id"
    t.string "ktp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
