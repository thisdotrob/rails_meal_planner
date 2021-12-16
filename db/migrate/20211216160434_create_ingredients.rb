class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :quantity_per_serving
      t.string :food_item_name
      t.string :food_item_unit

      t.timestamps
    end
  end
end
