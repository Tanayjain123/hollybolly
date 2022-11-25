class DishesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, except: [:index, :show]
  before_action :find_dish

  def index
    @categories = Category.all
    @dishes = Dish.where(nil)
    @dishes = @dishes.by_category(params[:category]) if params[:category].present?
  end

  def show
    @dish = Dish.find(params[:id])
  end

  private

  def find_dish
    @dish = Dish.find_by(id: params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :price , :description, :status, :category_id, :cart_id, :order_id)
  end

end
