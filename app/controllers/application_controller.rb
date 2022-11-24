class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  respond_to :html, :json


  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :current_cart
  #,except: [:new, :create]

  def admin_only
    unless current_user.admin
      redirect_to users_show_path(current_user), notice: "You must be an admin to perform that function!"
    end
  end

  private

  def current_cart

    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
    end
    if session[:cart_id] == nil
      @current_cart = Cart.create(user_id: current_user.id)
      session[:cart_id] = @current_cart.id
    end

  end




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :contact, :address, :age, :gender, :password, :password_confirmation)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :contact, :address, :age, :gender, :password, :password_confirmation)}
  end

end
