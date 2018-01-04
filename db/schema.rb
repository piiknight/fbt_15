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

ActiveRecord::Schema.define(version: 20180104071036) do

  create_table "bookingtours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "tours_id"
    t.bigint "users_id"
    t.float "price", limit: 24
    t.string "place_from"
    t.string "place_to"
    t.integer "quantity"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_bookingtours_on_tours_id"
    t.index ["users_id"], name: "index_bookingtours_on_users_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "users_id"
    t.bigint "reviews_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviews_id"], name: "index_comments_on_reviews_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "users_id"
    t.bigint "reviews_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviews_id"], name: "index_likes_on_reviews_id"
    t.index ["users_id"], name: "index_likes_on_users_id"
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "tours_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_ratings_on_tours_id"
    t.index ["users_id"], name: "index_ratings_on_users_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "users_id"
    t.bigint "tours_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tours_id"], name: "index_reviews_on_tours_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.float "price", limit: 24
    t.datetime "time_to"
    t.datetime "time_from"
    t.text "tour_info"
    t.string "image"
    t.bigint "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_tours_on_categories_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.string "sdt"
    t.string "email"
    t.string "password_digest"
    t.boolean "role"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookingtours", "tours", column: "tours_id"
  add_foreign_key "bookingtours", "users", column: "users_id"
  add_foreign_key "comments", "reviews", column: "reviews_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "likes", "reviews", column: "reviews_id"
  add_foreign_key "likes", "users", column: "users_id"
  add_foreign_key "ratings", "tours", column: "tours_id"
  add_foreign_key "ratings", "users", column: "users_id"
  add_foreign_key "reviews", "tours", column: "tours_id"
  add_foreign_key "reviews", "users", column: "users_id"
  add_foreign_key "tours", "categories", column: "categories_id"
end
