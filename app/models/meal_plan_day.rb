class MealPlanDay < ApplicationRecord
  belongs_to :meal_plan
  has_many :meals, dependent: :destroy

  validates :date, presence: true

  def calories
    result = 0
    self.meals.each do |meal|
      meal.recipe.ingredients.each do |ingredient|
        result += ingredient.quantity_per_serving * ingredient.food_item.calories / ingredient.food_item.macro_quantity
      end
    end
    result
  end

  def carbs
    result = 0
    self.meals.each do |meal|
      meal.recipe.ingredients.each do |ingredient|
        result += ingredient.quantity_per_serving * ingredient.food_item.carbs / ingredient.food_item.macro_quantity
      end
    end
    result
  end

  def protein
    result = 0
    self.meals.each do |meal|
      meal.recipe.ingredients.each do |ingredient|
        result += ingredient.quantity_per_serving * ingredient.food_item.protein / ingredient.food_item.macro_quantity
      end
    end
    result
  end

  def fat
    result = 0
    self.meals.each do |meal|
      meal.recipe.ingredients.each do |ingredient|
        result += ingredient.quantity_per_serving * ingredient.food_item.fat / ingredient.food_item.macro_quantity
      end
    end
    result
  end
end
