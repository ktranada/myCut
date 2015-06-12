class Api::PicturesController < ApplicationController
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
    params.require(:picture).permit(:picture_comment, :image)
  end

end
