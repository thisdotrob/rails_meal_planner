class AddProteinToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :protein, :integer
  end
end
