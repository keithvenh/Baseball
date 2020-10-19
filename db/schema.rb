# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_19_024036) do

  create_table "divisions", force: :cascade do |t|
    t.string "title"
    t.string "abbr"
    t.integer "sub_league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_league_id"], name: "index_divisions_on_sub_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "title"
    t.string "abbr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "bats"
    t.string "throws"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mlb_api_pid"
  end

  create_table "season_batting_stats", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.integer "season_id", null: false
    t.integer "g"
    t.integer "ab"
    t.integer "tpa"
    t.integer "h"
    t.integer "xbh"
    t.integer "tb"
    t.integer "d"
    t.integer "t"
    t.integer "hr"
    t.integer "bb"
    t.integer "ibb"
    t.integer "hbp"
    t.integer "so"
    t.integer "r"
    t.integer "rbi"
    t.integer "sb"
    t.integer "cs"
    t.integer "go"
    t.integer "gidp"
    t.integer "ao"
    t.float "go_ao"
    t.integer "sac"
    t.integer "sf"
    t.integer "hgnd"
    t.integer "hldr"
    t.integer "hpop"
    t.integer "hfly"
    t.integer "roe"
    t.integer "lob"
    t.float "avg"
    t.float "slg"
    t.float "obp"
    t.float "ops"
    t.float "babip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gidp_opp"
    t.index ["player_id"], name: "index_season_batting_stats_on_player_id"
    t.index ["season_id"], name: "index_season_batting_stats_on_season_id"
    t.index ["team_id"], name: "index_season_batting_stats_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.integer "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "sub_leagues", force: :cascade do |t|
    t.string "title"
    t.string "abbr"
    t.integer "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_sub_leagues_on_league_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "abbr"
    t.string "location"
    t.integer "division_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_teams_on_division_id"
  end

  create_table "user_players", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_user_players_on_player_id"
    t.index ["user_id"], name: "index_user_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "divisions", "sub_leagues"
  add_foreign_key "season_batting_stats", "players"
  add_foreign_key "season_batting_stats", "seasons"
  add_foreign_key "season_batting_stats", "teams"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "sub_leagues", "leagues"
  add_foreign_key "teams", "divisions"
  add_foreign_key "user_players", "players"
  add_foreign_key "user_players", "users"
end
