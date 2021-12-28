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
      p = params.require(:meal_plan).permit(:date_range_start, :date_range_end)
      if p[:date_range_start] != "" && p[:date_range_end] != ""
        d1 = Date.parse(p[:date_range_start])
        d2 = Date.parse(p[:date_range_end])
        { date_range: d1..d2 }
      else
        {}
      end
    end
end
