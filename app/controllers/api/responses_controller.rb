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
    end

    private

    def response_params
      params.require(:response).permit(:answer_id, :explanation)
    end
  end
end
