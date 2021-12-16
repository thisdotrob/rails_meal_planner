class FoodItem < ApplicationRecord
  validates :name, presence: true
  validates :unit, presence: true
end
