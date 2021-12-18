class FoodItem < ApplicationRecord
  alias_attribute :food_item_name, :name
  alias_attribute :food_item_unit, :unit
  validates :name, presence: true
  validates :unit, presence: true
end
