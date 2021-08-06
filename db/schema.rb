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

ActiveRecord::Schema.define(version: 2021_08_04_210354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_books_on_name", unique: true
  end

  create_table "books_spells", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "spell_id", null: false
    t.index ["spell_id", "book_id"], name: "index_books_spells_on_spell_id_and_book_id", unique: true
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.integer "level", default: 0, null: false
    t.string "school", null: false
    t.boolean "is_bard", default: false, null: false
    t.boolean "is_cleric", default: false, null: false
    t.boolean "is_druid", default: false, null: false
    t.boolean "is_paladin", default: false, null: false
    t.boolean "is_ranger", default: false, null: false
    t.boolean "is_sorcerer", default: false, null: false
    t.boolean "is_warlock", default: false, null: false
    t.boolean "is_wizard", default: false, null: false
    t.string "concentration", default: "No", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_spells_on_name", unique: true
  end

  add_foreign_key "books_spells", "books"
  add_foreign_key "books_spells", "spells"
end
