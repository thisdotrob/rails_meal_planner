class MealPlanDaysController < ApplicationController
  def copy
    template_mpd = MealPlanDay.find(params[:id])
    template_mpd.meal_plan.meal_plan_days.each { |mpd|
      if mpd.id != template_mpd.id
        mpd.meals.destroy_all
        template_mpd.meals.each { |m|
          cloned = m.dup
          cloned.meal_plan_day = mpd
          cloned.save
        }
      end
    }
    redirect_to template_mpd.meal_plan
  end
end
