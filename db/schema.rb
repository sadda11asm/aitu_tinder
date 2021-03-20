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

ActiveRecord::Schema.define(version: 2021_03_20_091416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hacknu_conversations", force: :cascade do |t|
    t.bigint "user1_id"
    t.bigint "user2_id"
    t.bigint "topic_room_id"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_room_id"], name: "index_hacknu_conversations_on_topic_room_id"
    t.index ["user1_id"], name: "index_hacknu_conversations_on_user1_id"
    t.index ["user2_id"], name: "index_hacknu_conversations_on_user2_id"
  end

  create_table "hacknu_images", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hacknu_images_on_user_id"
  end

  create_table "hacknu_likes", force: :cascade do |t|
    t.bigint "fan_id"
    t.bigint "crush_id"
    t.string "fan_like_type"
    t.string "crush_like_type"
    t.boolean "matched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crush_id"], name: "index_hacknu_likes_on_crush_id"
    t.index ["fan_id"], name: "index_hacknu_likes_on_fan_id"
  end

  create_table "hacknu_preferences", force: :cascade do |t|
    t.integer "min_age"
    t.integer "max_age"
    t.integer "distance"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hacknu_preferences_on_user_id"
  end

  create_table "hacknu_users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.integer "age"
    t.float "lat"
    t.float "lng"
    t.string "gender"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_rooms", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "user_id"
    t.boolean "free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_topic_rooms_on_topic_id"
    t.index ["user_id"], name: "index_topic_rooms_on_user_id"
  end

  create_table "topic_tags", force: :cascade do |t|
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tag_id"
    t.index ["tag_id"], name: "index_topic_tags_on_tag_id"
    t.index ["topic_id"], name: "index_topic_tags_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hacknu_users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.integer "age"
    t.float "lat"
    t.float "lng"
    t.string "gender"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aitu_id"
  end

  add_foreign_key "hacknu_conversations", "hacknu_topic_rooms", column: "topic_room_id"
  add_foreign_key "hacknu_conversations", "hacknu_users", column: "user1_id"
  add_foreign_key "hacknu_conversations", "hacknu_users", column: "user2_id"
  add_foreign_key "hacknu_conversations", "topic_rooms"
  add_foreign_key "hacknu_images", "hacknu_users", column: "user_id"
  add_foreign_key "hacknu_likes", "hacknu_users", column: "crush_id"
  add_foreign_key "hacknu_likes", "hacknu_users", column: "fan_id"
  add_foreign_key "hacknu_preferences", "hacknu_users", column: "user_id"
  add_foreign_key "topic_rooms", "hacknu_users", column: "user_id"
  add_foreign_key "topic_rooms", "topics"
  add_foreign_key "topic_tags", "tags"
  add_foreign_key "topic_tags", "topics"
end
