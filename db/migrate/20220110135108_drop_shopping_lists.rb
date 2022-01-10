class DropShoppingLists < ActiveRecord::Migration[6.1]
  def up
    drop_table :shopping_lists
  end
  def down
    create_table :shopping_lists do |t|
      t.belongs_to :meal_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
