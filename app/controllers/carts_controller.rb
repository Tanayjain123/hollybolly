class CartsController < ApplicationController
  before_action :authenticate_user!
    def show
        @cart = @current_cart
    end

    def destroy
        @cart = @current_cart
        @cart.destroy
        session[:cart_id] = nil
        redirect_to homepage_home_path
    end
end