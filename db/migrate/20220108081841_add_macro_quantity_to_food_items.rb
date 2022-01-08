class AddMacroQuantityToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :macro_quantity, :integer
  end
end
