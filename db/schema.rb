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

ActiveRecord::Schema.define(version: 20150201133756) do

  create_table "apps", force: true do |t|
    t.string   "name"
    t.string   "tagline"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube_id"
    t.integer  "view_count",         default: 0
    t.boolean  "is_processed",       default: false
    t.integer  "user_id"
    t.string   "logo"
    t.string   "category"
    t.integer  "cached_votes_total", default: 0
    t.string   "slug"
    t.string   "founders"
  end

  add_index "apps", ["cached_votes_total"], name: "index_apps_on_cached_votes_total"
  add_index "apps", ["name"], name: "index_apps_on_name", unique: true
  add_index "apps", ["slug"], name: "index_apps_on_slug", unique: true

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar"
    t.text     "description"
    t.string   "profile_image"
    t.text     "bio_1st_question"
    t.text     "bio_2nd_question"
    t.text     "bio_3rd_question"
    t.string   "social_angelist"
    t.string   "social_github"
    t.string   "social_twitter"
    t.string   "social_facebook"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "video_updates", force: true do |t|
    t.string   "title"
    t.string   "youtube_id"
    t.integer  "view_count",   default: 0
    t.boolean  "is_processed", default: false
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_updates", ["app_id"], name: "index_video_updates_on_app_id"

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
