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

ActiveRecord::Schema.define(version: 20140925195043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "provided_id"
    t.string   "token"
    t.string   "secret"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "games", force: true do |t|
    t.datetime "first_pitch_at"
    t.uuid     "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "venue_id"
  end

  add_index "games", ["away_team_id"], name: "index_games_on_away_team_id", using: :btree
  add_index "games", ["home_team_id"], name: "index_games_on_home_team_id", using: :btree
  add_index "games", ["venue_id"], name: "index_games_on_venue_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.uuid     "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_games", force: true do |t|
    t.integer  "trip_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trip_games", ["game_id"], name: "index_trip_games_on_game_id", using: :btree
  add_index "trip_games", ["trip_id"], name: "index_trip_games_on_trip_id", using: :btree

  create_table "trips", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "radius"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.uuid     "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "market"
  end

end
