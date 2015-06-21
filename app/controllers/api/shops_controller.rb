module Api
  class ShopsController < ApiController

    def index
      @shops = Shop.all
      render :index
    end

    def create
      @shop = Shop.new(shop_params)
      @shop.tag_list = params[:tag_list]
      @shop.zip = @shop.zip.to_i
      @shop.phone = @shop.phone.to_i
      if @shop.save
        render json: @shop
      else
        render json: @shop.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      @shop = Shop.find(params[:id])
      byebug
      @shop.tag_list = params[:tag_list]
      if @shop.update_attributes(shop_params)
        render json: @shop
      else
        render json: @shop.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @shop = Shop.find(params[:id])
      @shop.destroy
      render json: @shop
    end

    def show
      @shop = Shop.find(params[:id])
      @reviews = Review.where(shop_id: @shop.id)
      @barbers = Barber.where(shop_id: @shop.id)
      render :show
    end

    def search
      @shops = shop_search(search_data)
      render :index
    end

    private

    def search_data
       params[:search_query]
    end

    def shop_search(queries)
      queries[:loc] = "san francisco" unless queries[:loc].present?
      if (!queries[:des].empty?)
        description = queries[:des].split(",")[0]
        shops = (Shop.where("UPPER(name) LIKE ? ", "%#{description.upcase}%") +
                 Shop.tagged_with(queries[:des], any: :true)) &
                 Shop.near(queries[:loc], 6)
      else
        shops = Shop.near(queries[:loc], 6)
      end
      shops
    end

    def shop_params
      params.require(:shop).permit(:moderator_id, :name, :address, :city, :latitude, :longitude, :state, :zip, :rating,
                                   :phone, :tag_list, :photo_url)
    end

  end
end
