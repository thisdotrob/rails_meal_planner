class DropShoppingListItems < ActiveRecord::Migration[6.1]
  def up
    drop_table :shopping_list_items
  end
  def down
    create_table :shopping_list_items do |t|
      t.references :shopping_list, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true
      t.decimal :quantity
      t.boolean :done

      t.timestamps
    end
  end
end
