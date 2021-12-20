class ShoppingList < ApplicationRecord
  belongs_to :meal_plan
  has_many :shopping_list_items
end
