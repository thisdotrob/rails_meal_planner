class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
  end

  def show
    @food_item = FoodItem.find(params[:id])
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
        redirect_to @food_item
      end
    else
      render :new
    end
  end

  def edit
    @food_item = FoodItem.find(params[:id])
  end

  def update
    @food_item = FoodItem.find(params[:id])

    if @food_item.update(food_item_params)
      redirect_to @food_item
    else
      render :edit
    end
  end

  def destroy
    @food_item = FoodItem.find(params[:id])
    @food_item.destroy

    redirect_to food_items_path
  end

  private
    def food_item_params
      params.require(:food_item).permit(:name, :unit, :calories, :carbs, :protein, :fat, :macro_quantity)
    end
end
