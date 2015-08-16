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

ActiveRecord::Schema.define(version: 20150816212403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "phone_number"
    t.date     "appointment_date"
    t.string   "type"
    t.text     "comments"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "coupon_code"
    t.string   "stripe_token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "appointment_type"
    t.boolean  "deep_clean"
    t.boolean  "inside_fridge"
    t.boolean  "inside_oven"
    t.boolean  "inside_windows"
    t.boolean  "inside_cabinets"
    t.boolean  "walls"
    t.boolean  "move_inout"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "seo_pages", force: :cascade do |t|
    t.string   "h1_text"
    t.string   "h2_text"
    t.string   "og_description"
    t.string   "slug"
    t.string   "image_tag"
    t.string   "name"
    t.text     "paragraph_text"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "article_header"
    t.string   "article_image_file_name"
    t.string   "article_image_content_type"
    t.integer  "article_image_file_size"
    t.datetime "article_image_updated_at"
  end

end
