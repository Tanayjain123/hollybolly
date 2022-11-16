class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end
  

  def show
    @user = Category.find(params[:id])
  end


  private
  def category_params
   params.require(:category).permit(:category_name)
  end


end
