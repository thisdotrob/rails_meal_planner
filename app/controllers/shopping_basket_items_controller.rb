class ShoppingBasketItemsController < ApplicationController
  def create
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @shopping_basket_item = @meal_plan.shopping_basket_items.create(shopping_basket_item_params)
    if query_params[:hide_items_in_basket] == "true"
      redirect_to meal_plan_path(@meal_plan, hide_items_in_basket: true)
    else
      redirect_to @meal_plan
    end
  end

  def destroy
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @shopping_basket_item = @meal_plan.shopping_basket_items.find(params[:id])
    @shopping_basket_item.destroy
    redirect_to @meal_plan
  end
  
  private
    def shopping_basket_item_params
      params.require(:shopping_basket_item).permit(:food_item_id)
    end

    def query_params
      params.require(:shopping_basket_item).permit(:hide_items_in_basket)
    end
end
