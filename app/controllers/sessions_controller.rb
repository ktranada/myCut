class SessionsController < ApplicationController
  def new
    render "roots/root"
  end

  def create
    @user = User.find_by_credentials(params[:user])

    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid email and/or password"]
      render :new
    end
  end

  def guest
    user = User.guest_log_in
    sign_in!(user)
    redirect_to root_url

  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end
end
