class AddNoteToMealPlanDays < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_plan_days, :note, :string
  end
end
