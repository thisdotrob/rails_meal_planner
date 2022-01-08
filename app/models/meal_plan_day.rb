class MealPlanDay < ApplicationRecord
  belongs_to :meal_plan
  has_many :meals, dependent: :destroy

  validates :date, presence: true

  def calories
    result = 0
    self.meals.each do |meal|
      result += meal.recipe.calories
    end
    result
  end

  def carbs
    result = 0
    self.meals.each do |meal|
      result += meal.recipe.carbs
    end
    result
  end

  def protein
    result = 0
    self.meals.each do |meal|
      result += meal.recipe.protein
    end
    result
  end

  def fat
    result = 0
    self.meals.each do |meal|
      result += meal.recipe.fat
    end
    result
  end
end
