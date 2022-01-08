class RemoveMacroQuantityFromFoodItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_items, :macro_quantity, :integer
  end
end
