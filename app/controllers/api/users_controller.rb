module Api
  class Api::UsersController < ApiController
    def formatting_data
      render "formatting_data"
    end

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
    end
  end
end