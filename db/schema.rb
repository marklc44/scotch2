# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140919235043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fav_producers", force: true do |t|
    t.integer  "user_id"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fav_whiskies", force: true do |t|
    t.integer  "user_id"
    t.integer  "whisky_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flavor_profiles", force: true do |t|
    t.integer  "body"
    t.integer  "sweetness"
    t.integer  "smoky"
    t.integer  "medicinal"
    t.integer  "tobacco"
    t.integer  "honey"
    t.integer  "spicy"
    t.integer  "winey"
    t.integer  "nutty"
    t.integer  "malty"
    t.integer  "fruity"
    t.integer  "floral"
    t.string   "broad_keyword1"
    t.string   "broad_keyword2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flavored_id"
    t.string   "flavored_type"
  end

  create_table "producers", force: true do |t|
    t.string   "name"
    t.text     "url"
    t.text     "image_url"
    t.string   "wa_brand_id"
    t.string   "semantics3_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.datetime "expires_at"
  end

  create_table "whiskies", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "age"
    t.integer  "year"
    t.integer  "rating"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
