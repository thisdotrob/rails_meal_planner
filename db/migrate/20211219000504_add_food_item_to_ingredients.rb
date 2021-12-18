class AddFoodItemToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_reference :ingredients, :food_item, null: false, foreign_key: true
  end
end
