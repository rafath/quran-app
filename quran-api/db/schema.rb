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

ActiveRecord::Schema.define(version: 2020_05_18_103745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ayets", force: :cascade do |t|
    t.bigint "chapter_id"
    t.integer "ayet_number", limit: 2
    t.string "content", limit: 3000
    t.text "note"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_ayets_on_chapter_id"
    t.index ["slug"], name: "index_ayets_on_slug", unique: true
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name", null: false
    t.string "pl_name", null: false
    t.integer "chapter_number", limit: 2, null: false
    t.integer "ayets_quantity", limit: 2, null: false
    t.text "history"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_chapters_on_slug", unique: true
  end

  add_foreign_key "ayets", "chapters", on_delete: :cascade
end
