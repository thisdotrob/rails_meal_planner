class AddCarbsToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :carbs, :integer
  end
end
