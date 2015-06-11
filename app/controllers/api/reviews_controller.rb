class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if (@review.save)
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destrroy
    render json: {}
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
