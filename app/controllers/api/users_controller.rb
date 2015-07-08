module Api
  class UsersController < ApiController
    before_action :require_signed_in!

    def destroy
      @user = User.find(params[:id])
      if (@user.is_password?(params[:password]))
        @user.destroy
        render json: {}
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @user = current_user
      
      render :show
    end

    def update
      @user = User.find(params[:id])
      if (!@user.is_password?(user_params[:password]))
        render json: @user.errors[:base] << "You must enter your password before making any changes.", status: :unprocessable_entity
      else
        new_params = user_params
        new_params["password"] = (user_params["new_password"].nil?) ? user_params['password'] : user_params["new_password"]
        new_params.delete("new_password")
        new_params["photo_url"] = params["photo_url"]
        if @user.update_attributes(new_params)
          render json: @user
        else
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :photo_url, :password, :new_password, :email).select { |k, v| !v.empty? }
    end
  end
end
