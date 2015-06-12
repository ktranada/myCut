module Api
  class TagsController < ApiController
    def create

    end

    def index
      @tags = ActsAsTaggableOn::Tag.all
      render json: @tags
    end

    def show
      @tag = ActsAsTaggableOn::Tag.find(params[:id])
      @shops = Shop.tagged_with(@tag.name)
      render json: @shops
    end

  end
end
