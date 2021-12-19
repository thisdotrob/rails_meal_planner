class CreateMealPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plans do |t|
      t.daterange :date_range, null: false

      t.timestamps
    end
  end
end
