class RemoveFoodItemUnitFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :food_item_unit, :string
  end
end
