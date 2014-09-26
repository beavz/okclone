module Api
  class ResponsesController < ApiController
    before_filter :require_sign_in

    def index
      @responses = Response.where(["responses.user_id = ? ", params[:user_id]])
      render :index
    end

    def show
      @response = Response.find(params[:id])
      render :show
    end

    def create
      @response = current_user.responses.new(response_params)
      @response.save

      render :show
    end

    def update
      @response = current_user.responses.find(params[:id])
      @response.update(response_params)
      render :show
    end

    def destroy
      @response = current_user.responses.find(params[:id])
      @response.delete
      render :show
    end

    def set_acceptable_responses
      question_id = Answer.find(response_params[:answer_id]).question_id

      existing_acceptables = AcceptableResponse.find_by_sql([<<-SQL, question_id, current_user.id])
        SELECT acceptable_responses.*
        FROM acceptable_responses
        WHERE acceptable_responses.answer_id IN (
          SELECT answers.id
          FROM answers
          WHERE question_id = ?
        ) AND acceptable_responses.user_id = ?
      SQL

      unless existing_acceptables.empty?
        existing_acceptables.each { |item| item.destroy }
      end

      params[:acceptable_answers].each do |answer_id|
        AcceptableResponse.create({
          user_id: current_user.id,
          answer_id: answer_id
        })
      end

      render json: "ok"
    end

    private

    def response_params
      params.require(:response).permit(:answer_id, :explanation)
    end
  end
end
