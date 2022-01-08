class AddCaloriesToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :calories, :integer
  end
end
