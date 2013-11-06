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

ActiveRecord::Schema.define(version: 20131106135329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["player_id"], name: "index_contracts_on_player_id", using: :btree
  add_index "contracts", ["team_id"], name: "index_contracts_on_team_id", using: :btree

  create_table "matches", force: true do |t|
    t.datetime "date"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_types", force: true do |t|
    t.string   "description"
    t.boolean  "scorable",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "position"
    t.integer  "offense"
    t.integer  "defense"
    t.integer  "stamina"
    t.integer  "real_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["real_team_id"], name: "index_players_on_real_team_id", using: :btree

  create_table "plays", force: true do |t|
    t.integer  "match_id"
    t.string   "period"
    t.integer  "minute"
    t.integer  "play_type_id"
    t.string   "involved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plays", ["match_id"], name: "index_plays_on_match_id", using: :btree
  add_index "plays", ["play_type_id"], name: "index_plays_on_play_type_id", using: :btree

  create_table "real_teams", force: true do |t|
    t.string   "name"
    t.string   "fun_name"
    t.string   "main_color"
    t.string   "secondary_color"
    t.string   "third_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",                        null: false
    t.integer  "user_id",                     null: false
    t.string   "coat_of_arms"
    t.integer  "money",        default: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   default: "",    null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
