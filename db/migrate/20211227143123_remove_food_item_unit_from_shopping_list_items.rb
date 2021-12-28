class RemoveFoodItemUnitFromShoppingListItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :shopping_list_items, :food_item_unit, :string
  end
end
