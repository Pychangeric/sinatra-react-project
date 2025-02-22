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

ActiveRecord::Schema.define(version: 2023_06_06_111511) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "book_id"
    t.integer "user_id"
    t.index ["book_id"], name: "index_authors_on_book_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "amount"
    t.string "image_url"
    t.string "description"
    t.string "author"
    t.string "format"
    t.string "language"
    t.string "genre"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.integer "book_id"
    t.index ["book_id"], name: "index_users_on_book_id"
  end

  add_foreign_key "authors", "books"
  add_foreign_key "authors", "users"
  add_foreign_key "users", "books"
end
