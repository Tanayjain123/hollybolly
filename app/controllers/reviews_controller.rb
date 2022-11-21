class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end
  def new
    @user = User.find(params[:user_id])
    @dish = Dish.find(params[:dish_id])
    @review = @dish.reviews.new
  end
  def create
    #@user = User.find(params[:user_id])
    @dish = Dish.find(params[:dish_id])
    @review=@dish.reviews.merge(current_user.reviews).create(review_params)
    #@review = @user.@dish.reviews.build(review_params)

    if @review.save
      redirect_to homepage_home_path(@user,@post)
    else
      render 'new'
    end
  end

  private
   def review_params
    params.require(:review).permit(:review,:rating)
  end

end
