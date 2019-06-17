# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_17_082546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "association_excercise_muscles", force: :cascade do |t|
    t.bigint "excercise_id"
    t.bigint "muscle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excercise_id"], name: "index_association_excercise_muscles_on_excercise_id"
    t.index ["muscle_id"], name: "index_association_excercise_muscles_on_muscle_id"
  end

  create_table "association_excercise_weight_bundles", force: :cascade do |t|
    t.integer "excercise_id"
    t.integer "weight_bundle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excercise_id"], name: "index_association_excercise_weight_bundles_on_excercise_id"
    t.index ["weight_bundle_id"], name: "index_association_excercise_weight_bundles_on_weight_bundle_id"
  end

  create_table "association_weight_bundle_weights", force: :cascade do |t|
    t.integer "weight_id"
    t.integer "weight_bundle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weight_bundle_id"], name: "index_association_weight_bundle_weights_on_weight_bundle_id"
    t.index ["weight_id"], name: "index_association_weight_bundle_weights_on_weight_id"
  end

  create_table "excercises", force: :cascade do |t|
    t.string "name", null: false
    t.integer "default_repetitions_count", default: 15, null: false
    t.integer "default_time", default: 60, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "repetition_based", default: true
  end

  create_table "excercisings", force: :cascade do |t|
    t.integer "excercise_id", null: false
    t.integer "repetitions_count", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "resistance_duration"
    t.date "date", default: -> { "CURRENT_DATE" }, null: false
    t.index ["excercise_id"], name: "index_excercisings_on_excercise_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "excercise_id"
    t.index ["excercise_id"], name: "index_habits_on_excercise_id"
    t.index ["position"], name: "index_habits_on_position"
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "language", default: "en", null: false
    t.bigint "user_id", null: false
    t.string "time_zone", default: "Moscow", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weights", force: :cascade do |t|
    t.decimal "mass", default: "5000.0", null: false
    t.string "type", default: "Блин", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "association_excercise_muscles", "excercises"
  add_foreign_key "association_excercise_muscles", "muscles"
  add_foreign_key "habit_entries", "habits"
  add_foreign_key "habit_entries", "users"
  add_foreign_key "habits", "excercises"
  add_foreign_key "habits", "users"
  add_foreign_key "settings", "users"
end
