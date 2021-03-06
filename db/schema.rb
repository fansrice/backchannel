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

ActiveRecord::Schema.define(version: 20140216183909) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "visability"
  end

  create_table "comment_votes", force: true do |t|
    t.integer  "voter_id"
    t.integer  "quantity"
    t.integer  "post_comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comment_votes", ["post_comment_id"], name: "index_comment_votes_on_post_comment_id"
  add_index "comment_votes", ["user_id"], name: "index_comment_votes_on_user_id"

  create_table "post_comments", force: true do |t|
    t.integer  "commentor_id"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id"
  add_index "post_comments", ["user_id"], name: "index_post_comments_on_user_id"

  create_table "post_votes", force: true do |t|
    t.integer  "voter_id"
    t.integer  "quantity"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_votes", ["post_id"], name: "index_post_votes_on_post_id"
  add_index "post_votes", ["user_id"], name: "index_post_votes_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "category_id"
    t.integer  "auther_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count",    default: 0
    t.integer  "comments_count", default: 0
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "admin_type"
  end

end
