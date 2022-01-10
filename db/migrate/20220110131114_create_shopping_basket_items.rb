class CreateShoppingBasketItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_basket_items do |t|
      t.references :meal_plan, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
