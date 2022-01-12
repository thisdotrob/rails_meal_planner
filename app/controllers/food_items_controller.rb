class FoodItemsController < ApplicationController
  def index
    @show_deleted = params[:show_deleted] == "true"
    if @show_deleted
      @food_items = FoodItem.all
    else
      @food_items = FoodItem.where(deleted: false)
    end
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)

    if @food_item.save
      if params[:redirect]
        redirect_to params[:redirect] + "?food_item_id=#{@food_item.id}"
      else
        redirect_to food_items_path
      end
    else
      render :new
    end
  end

  def update
    @food_item = FoodItem.find(params[:id])
    @food_item.update(food_item_params)
    redirect_to food_items_path(query_params)
  end

  def destroy
    @food_item = FoodItem.find(params[:id])
    @food_item.update(deleted: true)
    @show_deleted = params[:show_deleted] == "true"
    if @show_deleted
      redirect_to food_items_path(show_deleted: true)
    else
      redirect_to food_items_path
    end
  end

  private
    def food_item_params
      params.require(:food_item).permit(:name, :unit, :calories, :carbs, :protein, :fat, :macro_quantity, :deleted, :show_deleted)
    end
    def query_params
      params.require(:query).permit(:show_deleted)
    end
end
