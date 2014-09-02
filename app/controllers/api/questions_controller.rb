module Api
  class QuestionsController < ApiController
    before_filter :require_sign_in
    
    def index
      user = User.find(params[:user_id])
      @questions = Question.find_unanswered(user)
      render :index
    end
    
    def show
      @question = Question.find(params[:id])
      render :show
    end

    def create 
    end

    def update
    end

    def destroy
    end
  end
end
