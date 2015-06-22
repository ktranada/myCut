module Api
  class ReviewsController < ApiController
    def index
      render json: Review.all
    end

    def create
      photo_params = review_params[:photos]
      tag_params = review_params[:taglist]

      #TODO parse photos + tags


      @review = Review.new(review_params)



      if (@review.save)
        pictures = photo_params
        tags = tag_params
        if (!pictures.nil?)
          photo_urls = pictures.split(",")
          photo_urls.each do |photo_url|
            @review.pictures.create!(photo_url: photo_url)
          end
        end
        if (!tags.nil?)
          @review.tag_list = tags
          @review.save
        end

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
      params.require(:review).permit(:body, :rating, :author_id, :barber_id, :shop_id, :photos, :taglist)
    end

  end
end
