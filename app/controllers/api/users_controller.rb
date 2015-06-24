module Api
  class UsersController < ApiController
    before_action :require_signed_in!

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: {}
    end

    def show
      @user = User.find(params[:id])
      render :show
    end

    private

    def user_params
      params.require(:user).permit(:thumb_url, :username, :email, :password, :photo_url)
    end

  end
end
