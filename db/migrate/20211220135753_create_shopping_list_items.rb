class CreateShoppingListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_list_items do |t|
      t.references :shopping_list, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true
      t.string :food_item_name
      t.string :food_item_unit
      t.decimal :quantity
      t.boolean :done

      t.timestamps
    end
  end
end
