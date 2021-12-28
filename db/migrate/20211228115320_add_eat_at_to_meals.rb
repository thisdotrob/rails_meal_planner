class AddEatAtToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :eat_at, :time
  end
end
