class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.decimal :servings, null: false
      t.references :meal_plan, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.datetime :eat_at, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
