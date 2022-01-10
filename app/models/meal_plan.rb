class MealPlan < ApplicationRecord
  has_many :meal_plan_days, dependent: :destroy
  has_one :shopping_list, dependent: :destroy

  validates :date_range, presence: true

  def shopping_list_items
      result = []
      self.meal_plan_days.each do |meal_plan_day|
        meal_plan_day.meals.each do |meal|
          meal.recipe.ingredients.each do |ingredient|
            quantity = ingredient.quantity_per_serving * meal.servings
            item_data = result.find do |item|
              item[:food_item_id] == ingredient.food_item_id
            end
            if !item_data
              result << {
                food_item_id: ingredient.food_item.id,
                food_item_name: ingredient.food_item.name,
                food_item_unit: ingredient.food_item.unit,
                quantity: quantity,
              }
            else
              item_data[:quantity] += quantity
            end
          end
        end
      end
      self.shopping_list.shopping_list_items.each do |shopping_list_item|
        if shopping_list_item.done
          item_data = result.find do |item|
            item[:food_item_id] == shopping_list_item.food_item_id
          end
          item_data[:done] = true
        end
      end
      result
  end
end
