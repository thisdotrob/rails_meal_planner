class ChangeQuantityPerServing < ActiveRecord::Migration[6.1]
  def change
    change_column :ingredients, :quantity_per_serving, :decimal
  end
end
