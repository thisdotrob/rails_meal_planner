class AddProteinToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :protein, :integer
  end
end
