module Api
  class BarbersController < ApiController
    def create
      @barber = Barber.new(barber_params)
      if @barber.save
        render json: @barber
      else
        render json: @barber.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      @barber = Barber.find(params[:id])
      if @barber.update_attributes(barber_params)
        render json: @barber
      else
        render json: @barber.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @barber = Barber.find(params[:id])
      render :show
    end

    def destroy
      @barber = Barber.find(params[:id])
      if @barber.shop.moderator.id == current_user.id
        @barber.destroy
        render json: {}
      else
        render json: ["You do not have permission to perform this action."], status: 403
      end
    end

    private

    def barber_params
      params.require(:barber).permit(:name, :rating, :photo_url)
    end

  end
end
