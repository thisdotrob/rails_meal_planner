class RemoveFoodItemNameFromShoppingListItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :shopping_list_items, :food_item_name, :string
  end
end
