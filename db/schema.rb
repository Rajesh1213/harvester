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

ActiveRecord::Schema.define(version: 2021_01_29_145459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hyper_links", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "scrape_url_id", null: false
    t.index ["scrape_url_id"], name: "index_hyper_links_on_scrape_url_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "param"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "hyper_link_id", null: false
    t.index ["hyper_link_id"], name: "index_parameters_on_hyper_link_id"
  end

  create_table "scrape_urls", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hyper_links", "scrape_urls"
  add_foreign_key "parameters", "hyper_links"
end
