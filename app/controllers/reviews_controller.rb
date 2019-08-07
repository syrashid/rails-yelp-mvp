class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.create(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.update(restaurant_id: params[:restaurant_id])

    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content,:rating)
  end
end
