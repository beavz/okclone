module Api
  class Api::MessagesController < ApiController
    def show
      @message = messages.find(params[:id])
      render :show
    end

    def index
      @messages = MessageThread.find(params[:message_thread_id]).messages
      render :index
    end

    def create
      @message = current_user.messages_from.new(message_params)
      @message.save
      render :show
    end

    private

    def message_params
      params.require(:message).permit(:text, :to_user_id, :thread_id)
    end
  end
end