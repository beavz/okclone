module Api
  class QuestionsController < ApiController
    before_filter :require_sign_in

    ### reconsider this maybe.
    def index
      user = User.find(params[:user_id])
      @question = [ Question.find_unanswered(user) ]
      render :index
    end

    def show
      @question = Question.find(params[:id])
      render :show
    end
  end
end
