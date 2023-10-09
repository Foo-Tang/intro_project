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

ActiveRecord::Schema[7.0].define(version: 2023_10_09_200543) do
  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.string "artist"
    t.text "text"
    t.string "imageurl"
    t.integer "supertypes_id", null: false
    t.integer "cardsets_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cardsets_id"], name: "index_cards_on_cardsets_id"
    t.index ["supertypes_id"], name: "index_cards_on_supertypes_id"
  end

  create_table "cardsets", force: :cascade do |t|
    t.string "name"
    t.string "series"
    t.date "releasedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "cardset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cardset_id"], name: "index_locations_on_cardset_id"
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supertypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "cardsets", column: "cardsets_id"
  add_foreign_key "cards", "supertypes", column: "supertypes_id"
  add_foreign_key "locations", "cardsets"
end
