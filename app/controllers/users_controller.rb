module Api
  class UsersController < ApplicationController
    before_action :require_current_user!, only: [:destroy]

    def new; end

    def create
      @user = User.new(user_params)
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
      params.require(:user).permit(:email, :password, :photo_url)
    end

  end
end
