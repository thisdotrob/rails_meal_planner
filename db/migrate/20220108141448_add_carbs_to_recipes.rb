class AddCarbsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :carbs, :integer
  end
end
