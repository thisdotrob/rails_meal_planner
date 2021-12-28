class MealPlan < ApplicationRecord
  has_many :meal_plan_days, dependent: :destroy
  has_one :shopping_list, dependent: :destroy
end
