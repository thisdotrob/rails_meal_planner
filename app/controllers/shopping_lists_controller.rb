class ShoppingListsController < ApplicationController
  def show
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    if @meal_plan.shopping_list.nil?
      @meal_plan.create_shopping_list
      shopping_list_items_data = []
      @meal_plan.meals.each do |meal|
        meal.recipe.ingredients.each do |ingredient|
          quantity = ingredient.quantity_per_serving * meal.servings
          item_data = shopping_list_items_data.find { |item|
            item[:food_item_id] == ingredient.food_item_id
          }
          if !item_data
            shopping_list_items_data << {
              food_item_id: ingredient.food_item.id,
              food_item_name: ingredient.food_item.name,
              food_item_unit: ingredient.food_item.unit,
              quantity: quantity,
            }
          else
            item_data[:quantity] += quantity
          end
        end
      end
      @meal_plan.shopping_list.shopping_list_items.create(shopping_list_items_data)
    end

    @shopping_list = @meal_plan.shopping_list
  end

  def destroy
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @meal_plan.shopping_list.destroy

    redirect_to root_path
  end
end
