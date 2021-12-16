class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.text :instructions
      t.string :title

      t.timestamps
    end
  end
end
