class MealPlan < ApplicationRecord
  has_many :meals, dependent: :destroy
end
