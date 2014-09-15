module Api
  class Api::MessagesController < ApiController
    def show
      @message = messages.find(params[:id])
      render :show
    end

    def index
      if params[:user_id]
        @messages = current_user.from_messages.where(to_user_id: params[:user_id])
        @messages.concat( current_user.to_messages.where(from_user_id: params[:user_id]))
      else
        @messages = current_user.from_messages + current_user.to_messages
      end
      render :index
    end

    def create
      @message = Message.new(message_params)
      @message.save
      render :show
    end

    private

    def message_params
      params.require(:message).permit(:text, :from_user_id, :to_user_id)
    end
  end
end