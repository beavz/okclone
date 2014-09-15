module Api
  class Api::MessagesController < ApiController
    def show
      @message = messages.find(params[:id])
      render :show
    end

    def index
      @messages = current_user.from_messages + current_user.to_messages
      render :index
    end

    def create
    end
  end
end