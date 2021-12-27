class IngredientsController < ApplicationController
  def new
    @query = params[:query]
    if @query
      @search_results = FoodItem.where("name ILIKE ?", "%#{@query}%")
    end
    if params[:food_item_id]
      @food_item = FoodItem.find(params[:food_item_id])
    end
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    @new_food_item = FoodItem.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    if ingredient_params[:food_item_id] == ""
      food_item = FoodItem.create(food_item_params)
      params[:ingredient][:food_item_id] = food_item.id
    end
    @ingredient = @recipe.ingredients.create(ingredient_params)
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to @recipe
    else
      render :edit
    end
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
      params.require(:ingredient).permit(:quantity_per_serving, :food_item_id)
    end
end
