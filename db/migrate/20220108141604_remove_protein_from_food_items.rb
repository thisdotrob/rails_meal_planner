class RemoveProteinFromFoodItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_items, :protein, :integer
  end
end
