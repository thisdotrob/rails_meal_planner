class MealPlanDay < ApplicationRecord
  belongs_to :meal_plan

  validates :date, presence: true
end
