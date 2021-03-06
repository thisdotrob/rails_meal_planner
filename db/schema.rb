# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_01_12_121026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carbs"
    t.boolean "deleted", default: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.decimal "quantity_per_serving"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_item_id", null: false
    t.index ["food_item_id"], name: "index_ingredients_on_food_item_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "meal_plan_days", force: :cascade do |t|
    t.date "date"
    t.bigint "meal_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.index ["meal_plan_id"], name: "index_meal_plan_days_on_meal_plan_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.daterange "date_range", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.decimal "servings", null: false
    t.bigint "recipe_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meal_plan_day_id", null: false
    t.time "eat_at"
    t.index ["meal_plan_day_id"], name: "index_meals_on_meal_plan_day_id"
    t.index ["recipe_id"], name: "index_meals_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.text "instructions"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fat"
    t.decimal "carbs"
    t.decimal "protein"
    t.integer "calories"
  end

  create_table "shopping_basket_items", force: :cascade do |t|
    t.bigint "meal_plan_id", null: false
    t.bigint "food_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_shopping_basket_items_on_food_item_id"
    t.index ["meal_plan_id"], name: "index_shopping_basket_items_on_meal_plan_id"
  end

  add_foreign_key "ingredients", "food_items"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "meal_plan_days", "meal_plans"
  add_foreign_key "meals", "meal_plan_days"
  add_foreign_key "meals", "recipes"
  add_foreign_key "shopping_basket_items", "food_items"
  add_foreign_key "shopping_basket_items", "meal_plans"
end
