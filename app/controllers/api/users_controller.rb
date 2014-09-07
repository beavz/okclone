module Api
  class Api::UsersController < ApiController
    def formatting_data
      render "formatting_data"
    end

    def show
      @user = User.find(params[:id])

      if @user == current_user
        @questions = Question.find_unanswered_questions(@user)
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
      @user.update(user_params)

      render "show"
    end

    private

    def user_params
      params.require(:user).permit! ### NOT SAFE COME BACK HERE SOON
    end
  end
end