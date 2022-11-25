class FavouriteDishesController < ApplicationController
  def index
    @favourite_dish = FavouriteDish.all
  end
  def new
    @dish = Dish.find(params[:dish_id])
    @favourite_dish = FavouriteDish.new
  end
  def create
   @favourite_dish=FavouriteDish.create(favourite_dish_params)
    if @favourite_dish.save
      redirect_to homepage_home_path(@favourite_dish)
    else
      render 'new'
    end
  end

  private

  def favourite_dish_params
    params.require(:favourite_dish).permit(:user_id,:dish_id)
  end

end
