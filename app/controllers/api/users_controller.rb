module Api
    class Api::UsersController < ApiController
    def show
        @user = User.find(params[:id])

        render json: { user: @user, current_user: current_user }
    end

    def index
        @users = User.all #change this to current_user.matched_users later

        render json: @users
    end

    def update
        @user = current_user

        unless @user.update(user_params)
          flash[:now] = @user.errors.full_messages
        end

        render json: { user: @user, current_user: current_user }
    end

    private

    def user_params
      params.require(:user).permit! ### NOT SAFE COME BACK HERE SOON
    end
  end
end