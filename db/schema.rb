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

ActiveRecord::Schema.define(version: 20150614233158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barbers", force: :cascade do |t|
    t.integer  "shop_id",    null: false
    t.string   "name",       null: false
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "barbers", ["shop_id"], name: "index_barbers_on_shop_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "picture_comment"
    t.integer  "imageable_id",    null: false
    t.string   "imageable_type",  null: false
    t.string   "photo_url",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["imageable_id", "imageable_type"], name: "index_pictures_on_imageable_id_and_imageable_type", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "body",                        null: false
    t.integer  "author_id",                   null: false
    t.integer  "shop_id",                     null: false
    t.float    "rating",        default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "barber_rating", default: 0.0
    t.integer  "barber_id",                   null: false
  end

  add_index "reviews", ["author_id", "shop_id"], name: "index_reviews_on_author_id_and_shop_id", using: :btree
  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id", using: :btree
  add_index "reviews", ["shop_id"], name: "index_reviews_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.integer  "moderator_id",                         null: false
    t.string   "name",                                 null: false
    t.string   "address",                              null: false
    t.string   "city",                                 null: false
    t.string   "state",                                null: false
    t.integer  "zip",                                  null: false
    t.integer  "phone",        limit: 8,               null: false
    t.float    "latitude",                             null: false
    t.float    "longitude",                            null: false
    t.float    "rating",                 default: 0.0, null: false
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["moderator_id"], name: "index_shops_on_moderator_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "photo_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
