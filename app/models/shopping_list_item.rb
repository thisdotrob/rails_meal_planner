class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :food_item
end
