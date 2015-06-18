module Api
  class ReviewsController < ApiController
    def index
      render json: Review.all
    end

    def create
      @review = Review.new(review_params)
      if (review_params.include?(:taglist))
        @review.tag_list = review_params.taglist
      end
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

    def show
      @review = Review.find(params[:id])
      @author = User.find(@review.author_id)
      render :show
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      render json: {}
    end

    private
    def review_params
      params.require(:review).permit(:body, :rating, :author_id, :barber_id, :photos, :shop_id, :taglist)
    end

  end
end
