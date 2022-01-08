class RemoveCaloriesFromFoodItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_items, :calories, :integer
  end
end
