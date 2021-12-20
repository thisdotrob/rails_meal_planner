class MealPlan < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_one :shopping_list, dependent: :destroy
end
