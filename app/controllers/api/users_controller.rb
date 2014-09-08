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
      if params[:search]
        @users = User.find_by_search(params[:search], current_user.id)
      elsif params[:browse]
        @users = User.find_by_browse(params[:browse], current_user.id)
      else
        @users = User.where(["users.id != ?", current_user.id])
      end

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