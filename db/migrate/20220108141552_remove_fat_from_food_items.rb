class RemoveFatFromFoodItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_items, :fat, :integer
  end
end
