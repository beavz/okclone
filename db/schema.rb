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

ActiveRecord::Schema.define(version: 20140915221817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptable_responses", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "answer_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acceptable_responses", ["user_id", "answer_id"], name: "index_acceptable_responses_on_user_id_and_answer_id", unique: true, using: :btree

  create_table "albums", force: true do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "answers", force: true do |t|
    t.integer  "question_id", null: false
    t.text     "text",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "label",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_threads", force: true do |t|
    t.integer  "user_id_1"
    t.integer  "user_id_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.boolean  "read",         default: false
    t.integer  "thread_id"
    t.integer  "from_user_id",                 null: false
    t.integer  "to_user_id",                   null: false
    t.text     "text",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "caption"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["album_id"], name: "index_pictures_on_album_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "text",       null: false
    t.integer  "category",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["category"], name: "index_questions_on_category", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "answer_id",   null: false
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "session_token",                         null: false
    t.string   "password_digest",                       null: false
    t.string   "username",                              null: false
    t.string   "email",                                 null: false
    t.integer  "age"
    t.integer  "zip_code"
    t.integer  "gender",                   default: 0
    t.integer  "orientation",              default: 0
    t.integer  "ethnicity",                default: 0
    t.integer  "height"
    t.integer  "body_type",                default: 0
    t.integer  "diet",                     default: 0
    t.integer  "smokes",                   default: 0
    t.integer  "drinks",                   default: 0
    t.integer  "drugs",                    default: 0
    t.integer  "religion",                 default: 0
    t.integer  "sign",                     default: 0
    t.integer  "education",                default: 0
    t.integer  "job",                      default: 0
    t.integer  "income",                   default: 0
    t.integer  "relationship_status",      default: 0
    t.integer  "relationship_type",        default: 0
    t.integer  "offspring",                default: 0
    t.integer  "pets",                     default: 0
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "looking_for_status",       default: 0
    t.boolean  "is_looking_for_men"
    t.boolean  "is_looking_for_women"
    t.boolean  "is_looking_for_friends"
    t.boolean  "is_looking_for_ltdating"
    t.boolean  "is_looking_for_stdating"
    t.boolean  "is_looking_for_sexitimes"
    t.text     "essay1",                   default: ""
    t.text     "essay2",                   default: ""
    t.text     "essay3",                   default: ""
    t.text     "essay4",                   default: ""
    t.text     "essay5",                   default: ""
    t.text     "essay6",                   default: ""
    t.text     "essay7",                   default: ""
    t.text     "essay8",                   default: ""
    t.integer  "avatar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
