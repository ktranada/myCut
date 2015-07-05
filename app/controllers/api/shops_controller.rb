module Api
  class ShopsController < ApiController

    def index
      @shops = Shop.near("san francisco", 7);
      
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
      @reviews = @shop.reviews.order("created_at DESC")
      @barbers = Barber.where(shop_id: @shop.id)
      render :show
    end

    def search
      @shops = filter_shops(filter_options)
      render :index
    end

    private

    def filter_options
      params[:filter_options]
    end

    def filter_shops(queries)
      queries[:loc] = "san francisco" unless queries[:loc].present?
      if (!queries[:des].empty?)
        description = queries[:des].split(",")[0]
        shops = (Shop.where("UPPER(name) LIKE ? ", "%#{description.upcase}%") +
                 Shop.tagged_with(queries[:des], any: :true )) &
                 Shop.near(queries[:loc], 6) &
                 Shop.joins('LEFT OUTER JOIN barbers ON shops.id = barbers.shop_id').where('barbers.shop_id IS NOT NULL');
      else
        shops = Shop.near(queries[:loc], 6).joins('LEFT OUTER JOIN barbers ON shops.id = barbers.shop_id').where('barbers.shop_id IS NOT NULL');
      end
      shops
    end

    def shop_params
      params.require(:shop).permit(:barbers,:moderator_id, :name, :address, :city, :latitude, :longitude, :state, :zip, :rating,
                                   :phone, :tag_list, :photo_url)
    end

  end
end
