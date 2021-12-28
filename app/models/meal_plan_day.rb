class MealPlanDay < ApplicationRecord
  belongs_to :meal_plan
  has_many :meals, dependent: :destroy

  validates :date, presence: true
end
