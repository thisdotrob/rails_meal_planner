class RemoveFoodItemNameFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :food_item_name, :string
  end
end
