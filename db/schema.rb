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

ActiveRecord::Schema[7.1].define(version: 2024_05_21_043843) do
  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flickr_photos", force: :cascade do |t|
    t.text "embed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icons", force: :cascade do |t|
    t.string "fa_class"
    t.string "fa_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "manafacturer"
    t.string "model_type"
    t.string "serial_no"
    t.string "condition"
    t.datetime "year"
    t.integer "price"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year_est"
    t.integer "make_id"
    t.index ["make_id"], name: "index_instruments_on_make_id"
  end

  create_table "makes", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_makes_on_category_id"
  end

  add_foreign_key "instruments", "makes"
  add_foreign_key "makes", "categories"
end
