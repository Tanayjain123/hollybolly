class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items
    def create
        # Find associated dish and current cart
        chosen_item = Dish.find(params[:dish_id])
        current_cart = @current_cart

        # If cart already has this dish then find the relevant cart_item and iterate quantity otherwise create a new cart_item for this dish
        if current_cart.dishes.include?(chosen_item)
            # Find the cart_item with the chosen_item
            @cart_item = current_cart.cart_items.find_by(dish_id: chosen_item)
            # Iterate the cart_item's quantity by one
            @cart_item.quantity += 1
        else
            @cart_item = CartItem.new
            @cart_item.cart = current_cart
            @cart_item.dish = chosen_item
        end

        # Save and redirect to cart show path
        @cart_item.save
        redirect_to cart_path(current_cart)
    end

    def add_quantity
        @cart_item.quantity += 1
        @cart_item.save
        redirect_to cart_path(@current_cart)
    end

    def reduce_quantity
        if @cart_item.quantity > 1
            @cart_item.quantity -= 1
        end
        @cart_item.save
        redirect_to cart_path(@current_cart)
    end

    def destroy
        @cart_item.destroy
        redirect_to cart_path(@current_cart)
    end

    private

        def set_cart_items
            @cart_item = CartItem.find_by(id: params[:id])
        end

        def cart_item_params
            params.require(:cart_item).permit(:quantity,:dish_id, :cart_id)
        end

end
