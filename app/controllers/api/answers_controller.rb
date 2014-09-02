module Api
  class AnswersController < ApiController
    before_filter :require_sign_in
    
    def index
      question = Question.find(params[:question_id])
      @answers = question.answers
      render :index
    end
    
    def show
      @answer = Answer.find(params[:id])
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
