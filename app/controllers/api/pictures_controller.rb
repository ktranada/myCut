module Api
  class PicturesController < ApiController
    def index
      @pictures = Picture.all
      render json: @pictures
    end

    def create
      @picture = Picture.new(picture_params)
      if @picture.save
        render json: @picture
      else
        render json: @picture.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
      render json: {}
    end

    def show
      @picture = Picture.find(params[:id])
      render json: @picture
    end

    private

    def picture_params
      params.require(:picture).permit(:picture_comment, :photo_url, :imageable_type, :imageable_id)
    end

  end
end
