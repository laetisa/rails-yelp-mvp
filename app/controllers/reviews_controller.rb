class ReviewsController < ApplicationController

  before_action :set_review
  def index
    @review = Review.select { |m| m.restaurant.id == @restaurant.id }
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    Review.destroy
    redirect_to restaurant_path
  end

  private

   def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

  def review_params
    params.require('review').permit(:content, :rating, :restaurant_id)

  end
end
