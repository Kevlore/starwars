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

ActiveRecord::Schema.define(version: 2021_02_24_001836) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "gender"
    t.string "hair_color"
    t.string "height"
    t.string "quote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "film_characters", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_film_characters_on_character_id"
    t.index ["film_id"], name: "index_film_characters_on_film_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode_id"
    t.string "director"
    t.date "release_date"
    t.integer "species_id", null: false
    t.integer "characters_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["characters_id"], name: "index_films_on_characters_id"
    t.index ["species_id"], name: "index_films_on_species_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "average_height"
    t.string "average_lifespan"
    t.string "skin_colours"
    t.string "language"
    t.integer "characters_id", null: false
    t.integer "films_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["characters_id"], name: "index_species_on_characters_id"
    t.index ["films_id"], name: "index_species_on_films_id"
  end

  add_foreign_key "film_characters", "characters"
  add_foreign_key "film_characters", "films"
  add_foreign_key "films", "characters", column: "characters_id"
  add_foreign_key "films", "species"
  add_foreign_key "species", "characters", column: "characters_id"
  add_foreign_key "species", "films", column: "films_id"
end
