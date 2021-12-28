class CreateMealPlanDays < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plan_days do |t|
      t.date :date
      t.references :meal_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
