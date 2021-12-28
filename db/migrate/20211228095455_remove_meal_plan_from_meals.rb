class RemoveMealPlanFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_reference :meals, :meal_plan, null: false, foreign_key: true
  end
end
