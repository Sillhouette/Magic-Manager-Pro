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

ActiveRecord::Schema.define(version: 20180702161803) do

  create_table "deck_magic_cards", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "magic_card_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string  "name"
    t.string  "format"
    t.integer "user_id"
    t.integer "card_count"
    t.integer "creature_count"
    t.integer "instant_sorcery_count"
    t.integer "land_count"
    t.integer "artifact_enchantment_count"
    t.integer "planeswalker_count"
    t.integer "sideboard_count"
  end

  create_table "magic_cards", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "user_id"
    t.string  "name"
    t.string  "quality"
    t.boolean "foil"
    t.string  "color"
    t.string  "types"
    t.string  "sub_types"
    t.string  "super_types"
    t.string  "rarity"
    t.string  "manna_cost"
    t.float   "value"
    t.integer "quantity"
    t.string  "set"
    t.boolean "side_board_option"
    t.boolean "main_board_option"
    t.boolean "standard"
    t.boolean "modern"
    t.boolean "legacy"
    t.boolean "vintage"
    t.boolean "sealed_deck"
    t.boolean "booster_draft"
    t.boolean "rochester_draft"
    t.boolean "two_headed_giant"
    t.boolean "pauper"
    t.boolean "peasant"
    t.boolean "frontier"
    t.boolean "rainbow_stairwell"
    t.boolean "singleton"
    t.boolean "tribal_wars"
    t.boolean "cube_draft"
    t.boolean "back_draft"
    t.boolean "reject_rare_draft"
    t.boolean "type_4"
    t.boolean "free_for_all"
    t.boolean "star"
    t.boolean "assassin"
    t.boolean "emperor"
    t.boolean "vanguard"
    t.boolean "planar_magic"
    t.boolean "archenemy"
    t.boolean "commander"
    t.boolean "brawl"
    t.boolean "mental_magic"
    t.boolean "mini_magic"
    t.boolean "horde_magic"
    t.boolean "ql_magic"
    t.boolean "fat_stack_tower_of_power"
    t.boolean "pack_war"
    t.boolean "penny_dreadful"
    t.boolean "commander_adventures"
    t.boolean "old_school"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "password_digest"
    t.integer "dci_number"
  end

end
