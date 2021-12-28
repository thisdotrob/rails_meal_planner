class MealsController < ApplicationController
  def new
    @query = params[:query]
    if @query
      @search_results = Recipe.where("title ILIKE ?", "%#{@query}%")
    end
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
    end
    @meal_plan_day = MealPlanDay.find(params[:meal_plan_day_id])
    @meal = Meal.new(servings: 1, eat_at: Time.new.change(hour: 12))
  end

  def create
    @meal_plan_day = MealPlanDay.find(params[:meal_plan_day_id])
    @meal = @meal_plan_day.meals.build(meal_params)
    if @meal.save
      redirect_to @meal_plan_day.meal_plan
    else
      render :new
    end
  end

  private
    def meal_params
      params.require(:meal).permit(:title, :eat_at, :servings, :recipe_id)
    end
end
