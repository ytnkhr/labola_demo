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

ActiveRecord::Schema.define(version: 20190517012525) do

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "content"
    t.string   "blog_published"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "blog_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruits", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.date     "hold_on"
    t.date     "deadline"
    t.string   "erea"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "recruit_type"
    t.string   "place"
    t.integer  "capacity"
    t.integer  "team_id"
    t.integer  "cost"
    t.string   "start_level"
    t.integer  "start_age"
    t.integer  "end_age"
    t.string   "tag_name"
    t.string   "image_name"
    t.time     "hold_start"
    t.time     "hold_end"
    t.time     "dead_end"
    t.string   "end_level"
    t.integer  "prefecture_id"
    t.integer  "sport_id"
    t.index ["prefecture_id"], name: "index_recruits_on_prefecture_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "category"
  end

  create_table "team_entries", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "prefecture_id"
    t.string   "area"
    t.string   "sport_id"
    t.string   "start_level"
    t.string   "end_level"
    t.string   "start_age"
    t.string   "end_age"
    t.text     "introduction"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "gender"
    t.string   "icon_name"
    t.text     "profile"
    t.string   "area"
    t.date     "birthday"
    t.string   "birth_published"
    t.string   "favor"
    t.integer  "prefecture_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
