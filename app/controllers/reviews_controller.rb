class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end
  def new
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

  private
   def review_params
    params.require(:review).permit(:review,:rating,:user_id,:dish_id)
  end

end
