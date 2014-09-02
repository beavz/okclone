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
    end

    def update
    end

    def destroy
    end
  end
end
