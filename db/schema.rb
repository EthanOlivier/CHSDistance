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

ActiveRecord::Schema[8.0].define(version: 2025_09_23_225934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "event_name", ["100m", "200m", "400m", "800m", "1600m", "3200m", "100m Hurdles", "110m Hurdles", "300m Hurdles", "4x100m", "4x400m", "4x800m", "Pole Vault", "High Jump", "Long Jump", "Triple Jump", "Javelin", "Discus", "Shot Put"]
  create_enum "gender_name", ["male", "female"]

  create_table "athlete_events", force: :cascade do |t|
    t.bigint "athlete_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_athlete_events_on_athlete_id"
    t.index ["event_id"], name: "index_athlete_events_on_event_id"
  end

  create_table "athletes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "grade"
    t.enum "gender", null: false, enum_type: "gender_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "athletes_workouts", id: false, force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "athlete_id", null: false
    t.index ["athlete_id"], name: "index_athletes_workouts_on_athlete_id"
    t.index ["workout_id", "athlete_id"], name: "index_athletes_workouts_on_workout_id_and_athlete_id", unique: true
    t.index ["workout_id"], name: "index_athletes_workouts_on_workout_id"
  end

  create_table "events", force: :cascade do |t|
    t.enum "name", null: false, enum_type: "event_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_workouts", id: false, force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "event_id", null: false
    t.index ["event_id"], name: "index_events_workouts_on_event_id"
    t.index ["workout_id", "event_id"], name: "index_events_workouts_on_workout_id_and_event_id", unique: true
    t.index ["workout_id"], name: "index_events_workouts_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "athlete_events", "athletes"
  add_foreign_key "athlete_events", "events"
end
