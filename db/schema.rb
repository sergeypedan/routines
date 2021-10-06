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

ActiveRecord::Schema.define(version: 2021_10_06_144847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "association_drug_substances", force: :cascade do |t|
    t.bigint "drug_id", null: false
    t.bigint "substance_id", null: false
    t.decimal "dose", null: false
    t.string "unit", default: "mg", null: false
    t.index ["drug_id"], name: "index_association_drug_substances_on_drug_id"
    t.index ["substance_id"], name: "index_association_drug_substances_on_substance_id"
  end

  create_table "association_excercise_muscles", force: :cascade do |t|
    t.bigint "excercise_id"
    t.bigint "muscle_id"
    t.index ["excercise_id"], name: "index_association_excercise_muscles_on_excercise_id"
    t.index ["muscle_id"], name: "index_association_excercise_muscles_on_muscle_id"
  end

  create_table "association_excercise_weight_bundles", force: :cascade do |t|
    t.integer "excercise_id"
    t.integer "weight_bundle_id"
    t.index ["excercise_id"], name: "index_association_excercise_weight_bundles_on_excercise_id"
    t.index ["weight_bundle_id"], name: "index_association_excercise_weight_bundles_on_weight_bundle_id"
  end

  create_table "association_weight_bundle_weights", force: :cascade do |t|
    t.integer "weight_id"
    t.integer "weight_bundle_id"
    t.index ["weight_bundle_id"], name: "index_association_weight_bundle_weights_on_weight_bundle_id"
    t.index ["weight_id"], name: "index_association_weight_bundle_weights_on_weight_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
  end

  create_table "drug_administrations", force: :cascade do |t|
    t.bigint "drug_id", null: false
    t.string "dose", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_drug_administrations_on_drug_id"
  end

  create_table "drug_forms", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.string "unit_en", default: "pc.", null: false
    t.string "unit_ru", default: "шт.", null: false
  end

  create_table "drug_intakes", force: :cascade do |t|
    t.bigint "drug_id", null: false
    t.datetime "created_at", null: false
    t.float "amount", default: 1.0, null: false
    t.index ["drug_id"], name: "index_drug_intakes_on_drug_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "drug_form_id", null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_drugs_on_brand_id"
    t.index ["drug_form_id"], name: "index_drugs_on_drug_form_id"
  end

  create_table "excercise_body_positions", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name_en"], name: "index_excercise_body_positions_on_name_en", unique: true
    t.index ["name_ru"], name: "index_excercise_body_positions_on_name_ru", unique: true
  end

  create_table "excercise_furnitures", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name_en"], name: "index_excercise_furnitures_on_name_en", unique: true
    t.index ["name_ru"], name: "index_excercise_furnitures_on_name_ru", unique: true
  end

  create_table "excercise_grips", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name_en"], name: "index_excercise_grips_on_name_en", unique: true
    t.index ["name_ru"], name: "index_excercise_grips_on_name_ru", unique: true
  end

  create_table "excercise_weight_types", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name_en"], name: "index_excercise_weight_types_on_name_en", unique: true
    t.index ["name_ru"], name: "index_excercise_weight_types_on_name_ru", unique: true
  end

  create_table "excercises", force: :cascade do |t|
    t.string "name", null: false
    t.integer "default_repetitions_count", default: 15, null: false
    t.integer "default_time", default: 60, null: false
    t.boolean "repetition_based", default: true
    t.bigint "main_muscle_id", null: false
    t.float "default_weight", default: 0.0, null: false
    t.string "flavor_en"
    t.string "flavor_ru"
    t.string "name_en"
    t.bigint "body_position_id"
    t.bigint "weight_type_id"
    t.bigint "furniture_id"
    t.bigint "grip_id"
    t.boolean "simultaneously"
    t.integer "workouts_count", default: 0, null: false
    t.integer "angle_max"
    t.index ["body_position_id"], name: "index_excercises_on_body_position_id"
    t.index ["furniture_id"], name: "index_excercises_on_furniture_id"
    t.index ["grip_id"], name: "index_excercises_on_grip_id"
    t.index ["main_muscle_id"], name: "index_excercises_on_main_muscle_id"
    t.index ["weight_type_id"], name: "index_excercises_on_weight_type_id"
  end

  create_table "habit_entries", force: :cascade do |t|
    t.bigint "habit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time", default: 0, null: false, comment: "in seconds"
    t.bigint "user_id", null: false
    t.index ["habit_id"], name: "index_habit_entries_on_habit_id"
    t.index ["user_id"], name: "index_habit_entries_on_user_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name", null: false
    t.integer "rounds_per_day", default: 1, null: false
    t.integer "time_per_round", default: 0, null: false
    t.string "time_unit", default: "minutes", null: false
    t.integer "position", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "excercise_id"
    t.index ["excercise_id"], name: "index_habits_on_excercise_id"
    t.index ["position"], name: "index_habits_on_position"
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "health_markers", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.string "unit", null: false
    t.float "healthy_value_min", null: false
    t.float "healthy_value_max", null: false
    t.string "healthy_value_source_name"
    t.string "healthy_value_source_url"
    t.bigint "measurements_group_id"
    t.string "abbr_en", limit: 10
    t.string "abbr_ru", limit: 10
    t.bigint "measurement_object_id", null: false
    t.index ["measurement_object_id"], name: "index_health_markers_on_measurement_object_id"
    t.index ["measurements_group_id"], name: "index_health_markers_on_measurements_group_id"
  end

  create_table "labs", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "city_id", null: false
    t.string "street_address"
    t.index ["city_id"], name: "index_labs_on_city_id"
  end

  create_table "measurement_objects", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.float "value", null: false
    t.bigint "lab_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "marker_id"
    t.index ["lab_id"], name: "index_measurements_on_lab_id"
    t.index ["marker_id"], name: "index_measurements_on_marker_id"
    t.index ["user_id"], name: "index_measurements_on_user_id"
  end

  create_table "measurements_groups", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
  end

  create_table "mood_entries", force: :cascade do |t|
    t.bigint "mood_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "why"
    t.text "comment"
    t.index ["mood_id"], name: "index_mood_entries_on_mood_id"
    t.index ["user_id"], name: "index_mood_entries_on_user_id"
  end

  create_table "moods", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ru", null: false
    t.integer "energy", default: 50
    t.integer "positivity", default: 50
    t.index ["name_en"], name: "index_moods_on_name_en", unique: true
    t.index ["name_ru"], name: "index_moods_on_name_ru", unique: true
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en"
    t.index ["name"], name: "index_muscles_on_name", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "language", default: "en", null: false
    t.bigint "user_id", null: false
    t.string "time_zone", default: "Moscow", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "substances", force: :cascade do |t|
    t.string "name", null: false
    t.string "daily_dosage"
    t.string "main_function", null: false
    t.string "dosage_unit", limit: 20
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "weight_bundles", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "weight", null: false
  end

  create_table "weights", force: :cascade do |t|
    t.decimal "mass", default: "5000.0", null: false
    t.string "type", default: "Блин", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "excercise_id", null: false
    t.integer "repetitions_count", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "resistance_duration"
    t.date "date", default: -> { "CURRENT_DATE" }, null: false
    t.float "weight", default: 0.0, null: false
    t.index ["excercise_id"], name: "index_workouts_on_excercise_id"
  end

  add_foreign_key "association_drug_substances", "drugs"
  add_foreign_key "association_drug_substances", "substances"
  add_foreign_key "association_excercise_muscles", "excercises"
  add_foreign_key "association_excercise_muscles", "muscles"
  add_foreign_key "drug_administrations", "drugs"
  add_foreign_key "drug_intakes", "drugs"
  add_foreign_key "drugs", "brands"
  add_foreign_key "drugs", "drug_forms"
  add_foreign_key "excercises", "excercise_body_positions", column: "body_position_id"
  add_foreign_key "excercises", "excercise_furnitures", column: "furniture_id"
  add_foreign_key "excercises", "excercise_grips", column: "grip_id"
  add_foreign_key "excercises", "excercise_weight_types", column: "weight_type_id"
  add_foreign_key "excercises", "muscles", column: "main_muscle_id"
  add_foreign_key "habit_entries", "habits"
  add_foreign_key "habit_entries", "users"
  add_foreign_key "habits", "excercises"
  add_foreign_key "habits", "users"
  add_foreign_key "health_markers", "measurement_objects"
  add_foreign_key "health_markers", "measurements_groups"
  add_foreign_key "labs", "cities"
  add_foreign_key "measurements", "health_markers", column: "marker_id"
  add_foreign_key "measurements", "labs"
  add_foreign_key "measurements", "users"
  add_foreign_key "mood_entries", "moods"
  add_foreign_key "mood_entries", "users"
  add_foreign_key "settings", "users"
end
