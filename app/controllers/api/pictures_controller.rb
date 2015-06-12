module Api
  class PicturesController < ApiController
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

    private

    def picture_params
      params.require(:picture).permit(:picture_comment, :photo_url)
    end

  end
end
