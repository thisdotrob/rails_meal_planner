class ChangeNutritionFieldsToDecimalInRecipes < ActiveRecord::Migration[6.1]
  def up
    change_table :recipes do |t|
      t.change :fat, :decimal
      t.change :carbs, :decimal
      t.change :protein, :decimal
    end
  end

  def down
    change_table :recipes do |t|
      t.change :fat, :decimal
      t.change :carbs, :decimal
      t.change :protein, :decimal
    end
  end
end
