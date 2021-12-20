class MealsController < ApplicationController
  def new
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @meal = Meal.new
    @recipe_title_query = params[:recipe_title_query]
    @recipe_search_result = Recipe.find_by(title: @recipe_title_query)
  end

  def create
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @meal = @meal_plan.meals.build(meal_params)
    if @meal.save
      redirect_to @meal_plan
    else
      render :new
    end
  end

  private
    def meal_params
      params.require(:meal).permit(:title, :eat_at, :servings, :recipe_id)
    end
end
