  class UsersController < ApplicationController
    def new; end

    def create
      @user = User.new(user_params)
      @user.photo_url = "https://dl.dropboxusercontent.com/s/zp27re1j4301pii/user_5.jpg?dl=0"
      if (@user.save)
        sign_in!(@user)
        redirect_to root_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end



    private

    def user_params
      params.require(:user).permit(:thumb_url, :username, :email, :password, :photo_url)
    end

  end
