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

ActiveRecord::Schema.define(version: 20221121062242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "date"
    t.integer  "no_of_people"
    t.string   "occassion"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "dish_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
    t.index ["dish_id"], name: "index_cart_items_on_dish_id", using: :btree
    t.index ["order_id"], name: "index_cart_items_on_order_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "total_amount"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "dinning_tables", force: :cascade do |t|
    t.integer  "sitting_capacity"
    t.integer  "booking_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["booking_id"], name: "index_dinning_tables_on_booking_id", using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "description"
    t.integer  "status",      default: 0
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["category_id"], name: "index_dishes_on_category_id", using: :btree
  end

  create_table "favourite_dishes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dish_id"
    t.index ["dish_id"], name: "index_favourite_dishes_on_dish_id", using: :btree
    t.index ["user_id"], name: "index_favourite_dishes_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.integer  "order_status", default: 0
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "review"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dish_id"
    t.index ["dish_id"], name: "index_reviews_on_dish_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "name"
    t.string   "contact"
    t.integer  "age"
    t.string   "address"
    t.integer  "gender"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "carts", "users"
  add_foreign_key "dinning_tables", "bookings"
  add_foreign_key "dishes", "categories"
  add_foreign_key "favourite_dishes", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
end
