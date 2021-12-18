class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    if ingredient_params[:food_item_id] == ""
      food_item = FoodItem.create(food_item_params)
      p food_item
      params[:ingredient][:food_item_id] = food_item.id

    end
    @ingredient = @recipe.ingredients.create(ingredient_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private
    def food_item_params
      params.require(:ingredient).permit(:food_item_name, :food_item_unit)
    end

    def ingredient_params
      params.require(:ingredient).permit(:quantity_per_serving, :food_item_name, :food_item_unit, :food_item_id)
    end
end
