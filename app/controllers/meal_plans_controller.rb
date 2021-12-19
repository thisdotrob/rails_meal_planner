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
    d1 = Date.parse(meal_plan_params[:date_range_start])
    d2 = Date.parse(meal_plan_params[:date_range_end])

    @meal_plan = MealPlan.new(date_range: d1..d2)

    if @meal_plan.save
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

    d1 = Date.parse(meal_plan_params[:date_range_start])
    d2 = Date.parse(meal_plan_params[:date_range_end])

    if @meal_plan.update(date_range: d1..d2)
      redirect_to @meal_plan
    else
      render :edit
    end
  end

  def destroy
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy

    redirect_to root_path
  end

  private
    def meal_plan_params
      params.require(:meal_plan).permit(:date_range_start, :date_range_end)
    end
end
