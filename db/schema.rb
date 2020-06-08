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

ActiveRecord::Schema.define(version: 2020_05_08_015437) do

  create_table "customer_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customer_id"], name: "index_customer_items_on_customer_id"
    t.index ["item_id"], name: "index_customer_items_on_item_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.string "nickname"
    t.date "birthday"
    t.string "phone"
    t.string "email"
    t.text "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price"
    t.text "image"
    t.text "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "customer_items", "items"
end
