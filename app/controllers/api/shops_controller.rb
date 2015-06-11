class Api::ShopsController < ApplicationController
  def index
    @shops = Shop.all
    render json: @shops
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      render json: @shop
    else
      render json: @shop.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @shop = Shop.find(params[:id])
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
    render json: @shop
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :city, :state, :rating,
                                 :phone, :rating, :location)
  end

end
