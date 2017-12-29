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

ActiveRecord::Schema.define(version: 20171227104828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer "partner_id"
    t.string "location"
    t.string "room_type"
    t.integer "num_of_guest"
    t.integer "price_per_night"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "area_id"
    t.integer "point_wallet_id"
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchased_coupon_id"
    t.integer "discounted_price"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "point_wallets", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "balance"
    t.integer "earned"
    t.integer "redeemed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_point_wallets_on_user_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.integer "area_id"
    t.string "name"
    t.string "reward_type"
    t.integer "value"
    t.integer "point"
    t.string "description"
    t.string "terms_conditions"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "promo"
  end

  create_table "purchased_coupons", force: :cascade do |t|
    t.bigint "promotion_id"
    t.bigint "point_wallet_id"
    t.datetime "claimed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["point_wallet_id"], name: "index_purchased_coupons_on_point_wallet_id"
    t.index ["promotion_id"], name: "index_purchased_coupons_on_promotion_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
