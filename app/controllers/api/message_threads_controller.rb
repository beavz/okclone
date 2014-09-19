module Api
  class MessageThreadsController < ApiController
    def index
      @threads = current_user.threads
      render :index
    end

    def show
      @thread = current_user.threads
        .where(["user_id_2 = ? OR user_id_1 = ?", params[:id], params[:id]]).first
        ##in this case, params[:id] is NOT THE THREAD ID, it is the other user's id
      unless @thread
        @thread = current_user.threads.create({user_id_1: current_user.id, user_id_2: params[:id]})
      end
      render :show
    end

  end
end
