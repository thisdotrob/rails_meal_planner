class AddFatToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :fat, :integer
  end
end
