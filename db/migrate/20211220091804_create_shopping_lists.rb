class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.belongs_to :meal_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
