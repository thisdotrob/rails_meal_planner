class Meal < ApplicationRecord
  belongs_to :meal_plan_day
  belongs_to :recipe
end
