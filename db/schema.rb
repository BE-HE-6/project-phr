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

ActiveRecord::Schema[7.0].define(version: 2022_06_26_135910) do
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

end
