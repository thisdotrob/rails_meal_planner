class RemoveEatAtFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :eat_at, :datetime
  end
end
