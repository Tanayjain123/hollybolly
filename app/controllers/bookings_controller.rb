class BookingsController < ApplicationController
  def index
    @booking = Booking.all
  end
  def new
    @user=User.find(params[:user_id])
    @booking = @user.bookings.new
  end
  def create
    @user = User.find(params[:user_id])
    @booking = @user.bookings.build(booking_params)
    if @booking.save
      redirect_to  user_booking_path(@user,@booking)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @booking = @user.bookings.find(params[:id])
  end


  private
  def booking_params
    params.require(:booking).permit(:date, :no_of_people, :occassion)
  end
end
