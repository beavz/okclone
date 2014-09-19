module Api
  class MessageThreadsController < ApiController
    def index
      @threads = current_user.threads
      render :index
    end

    def show
      @thread = current_user.threads.find(params[:id])
      render :show
    end

    def get_or_create_by_user
      @thread = current_user.threads
        .where(["user_id_1 = ? OR user_id_2 = ?", params[:user_id], params[:user_id]]).first
      unless @thread
        @thread = MessageThread.new(user_id_1: current_user.id, user_id_2: params[:user_id])
        @thread.save
      end

      render :show
    end

  end
end
