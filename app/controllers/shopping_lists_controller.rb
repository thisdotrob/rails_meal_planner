class ShoppingListsController < ApplicationController
  def show
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    if @meal_plan.shopping_list.nil?
      @meal_plan.create_shopping_list
    end

    @shopping_list = @meal_plan.shopping_list
  end
end
