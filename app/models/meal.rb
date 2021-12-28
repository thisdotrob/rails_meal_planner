class Meal < ApplicationRecord
  belongs_to :meal_plan_day
  belongs_to :recipe

  def eat_at
    self[:eat_at].to_s :time
  end
end
