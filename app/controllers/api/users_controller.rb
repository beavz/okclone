module Api
  class Api::UsersController < ApiController
      
    def show
      @user = User.find(params[:id])
      if @user == current_user
        @questions = Question.find_unanswered(current_user)
      end
      
      render "show"
    end

    def index
        @users = User.all.where(["users.id != ?", current_user.id])
        #change this to current_user.matched_users later??

        render "index"
    end

    def update
        @user = current_user

        unless @user.update(user_params)
          flash[:now] = @user.errors.full_messages
        end

        render json: { user: @user }
    end

    private

    def user_params
      params.require(:user).permit! ### NOT SAFE COME BACK HERE SOON
    end
  end
end