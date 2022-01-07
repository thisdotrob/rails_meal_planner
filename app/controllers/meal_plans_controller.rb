class MealPlansController < ApplicationController
  def index
    @meal_plans = MealPlan.all
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
  end

  def new
    @meal_plan = MealPlan.new
  end

  def create
    @meal_plan = MealPlan.new(meal_plan_params)

    if @meal_plan.save
      @meal_plan.date_range.each { |date|
        @meal_plan.meal_plan_days.create(date: date)
      }
      redirect_to @meal_plan
    else
      render :new
    end
  end

  def edit
    @meal_plan = MealPlan.find(params[:id])
  end

  def update
    @meal_plan = MealPlan.find(params[:id])

    params[:meal_plan_day].each do |id, meal_plan_day_params|
      meal_plan_day = MealPlanDay.find(id)
      if !meal_plan_day.update(meal_plan_day_params.permit(:note))
        render :edit
      end
    end

    if @meal_plan.update(meal_plan_params)
      redirect_to @meal_plan
    else
      render :edit
    end
  end

  def destroy
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy

    redirect_to meal_plans_path
  end

  private
    def meal_plan_params
      p = params.require(:meal_plan).permit(:date_range_start, :date_range_end, :meal_plan_day)
      if p[:date_range_start] != "" && p[:date_range_end] != ""
        d1 = Date.parse(p[:date_range_start])
        d2 = Date.parse(p[:date_range_end])
        p[:date_range] = d1..d2
      end
      p.delete(:date_range_start)
      p.delete(:date_range_end)
      p
    end
end
