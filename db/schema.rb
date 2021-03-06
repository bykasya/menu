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

ActiveRecord::Schema.define(version: 2020_05_30_023528) do

  create_table "dishes", force: :cascade do |t|
    t.string "dname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes_ingredients", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_dishes_ingredients_on_dish_id"
    t.index ["ingredient_id"], name: "index_dishes_ingredients_on_ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "iname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_planners", force: :cascade do |t|
    t.date "date"
    t.integer "dish_type"
    t.integer "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_menu_planners_on_dish_id"
  end

end
