  class UsersController < ApplicationController
    before_action :require_current_user!, only: [:destroy]

    def new; end

    def create
      @user = User.new(user_params)
      @user.photo_url = "http://res.cloudinary.com/mycut/image/upload/c_fill,h_120,r_max,w_120/v1434910961/default_avatar.jpg"
      if (@user.save)
        sign_in!(@user)
        redirect_to root_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end

    def destroy
    end

    def show
      @user = User.find(params[:id])
      render :show
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :photo_url)
    end

  end
