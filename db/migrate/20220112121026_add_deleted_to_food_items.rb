class AddDeletedToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :deleted, :boolean, default: false
  end
end
