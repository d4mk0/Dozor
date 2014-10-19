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

ActiveRecord::Schema.define(version: 20141018205619) do

  create_table "attempts", force: true do |t|
    t.string   "result",             null: false
    t.string   "code"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "task_id",            null: false
    t.integer  "team_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attempts", ["task_id"], name: "index_attempts_on_task_id", using: :btree
  add_index "attempts", ["team_id"], name: "index_attempts_on_team_id", using: :btree

  create_table "quests", force: true do |t|
    t.datetime "start_at",                    null: false
    t.datetime "end_at",                      null: false
    t.string   "name",                        null: false
    t.text     "description"
    t.boolean  "published",   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name",                         null: false
    t.string   "answer_type",                  null: false
    t.string   "success_code",                 null: false
    t.text     "description"
    t.boolean  "published",    default: false, null: false
    t.integer  "quest_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["quest_id"], name: "index_tasks_on_quest_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name",                        null: false
    t.string   "access_code",                 null: false
    t.boolean  "is_admitted", default: false, null: false
    t.integer  "quest_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["quest_id"], name: "index_teams_on_quest_id", using: :btree

end
