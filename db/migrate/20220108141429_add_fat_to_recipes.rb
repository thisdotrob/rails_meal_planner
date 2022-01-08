class AddFatToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :fat, :integer
  end
end
