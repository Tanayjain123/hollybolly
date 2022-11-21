class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to homepage_home_path, notice: "You've successfully created an order!"
  end

  private
    def order_params
      params.require(:order).permit(:address,:name,:email,:status, :user_id)
    end
end
