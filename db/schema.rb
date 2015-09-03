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

ActiveRecord::Schema.define(version: 20150902214605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fielders", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "innings_played"
    t.integer  "put_outs"
    t.integer  "fielding_errors"
    t.integer  "throwing_errors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kickers", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "hits"
    t.integer  "at_bats"
    t.integer  "singles"
    t.integer  "doubles"
    t.integer  "triples"
    t.integer  "home_runs"
    t.integer  "runs"
    t.integer  "rbi"
    t.integer  "walks"
    t.integer  "strikeouts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pitchers", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "batters_faced"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "earned_runs"
    t.integer  "runs"
    t.integer  "hits"
    t.integer  "home_runs"
    t.integer  "walks"
    t.integer  "strikeouts"
    t.integer  "wild_pitch"
    t.integer  "saves"
    t.integer  "strikes"
    t.integer  "balls"
    t.integer  "pitches"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "jersey_number"
    t.integer  "kicker_id"
    t.integer  "pitcher_id"
    t.integer  "fielder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "win"
    t.integer  "loss"
    t.integer  "draw"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
