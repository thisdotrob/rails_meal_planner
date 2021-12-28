class AddMealPlanDayToMeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :meals, :meal_plan_day, null: false, foreign_key: true
  end
end
