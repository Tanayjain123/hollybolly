class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end
  def new
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
  end
  def create
    @review=Review.create(review_params)
    if @review.save
      redirect_to homepage_home_path(@review)
    else
      render 'new'
    end
  end
  def show
    @review = Review.find(params[:id])
  end
  private

  def review_params
    params.require(:review).permit(:review,:rating,:user_id,:dish_id)
  end

end
