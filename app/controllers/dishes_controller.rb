class DishesController < ApplicationController

 def index
  @dish = Dish.all
 end

 def show
  @dish = Dish.find(params[:id])
 end


  private
  def dish_params
  params.require(:dish).permit(:name, :price , :description, :status)
  end

end
