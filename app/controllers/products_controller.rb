class ProductsController < ApplicationController

 def index
  @product = Product.all
 end

 def show
  @product = Product.find(params[:id])
 end


  private
  def product_params
  params.require(:product).permit(:name, :price , :description, :status)
  end

end
