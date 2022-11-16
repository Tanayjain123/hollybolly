class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end
  def new
    @Category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to  category_path(@category)
    else
      render 'new'
    end
  end

  def show
    @user = Category.find(params[:id])
  end


  private
  def category_params
   params.require(:category).permit(:category_name)
  end


end
