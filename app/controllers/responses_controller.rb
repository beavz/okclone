class ResponsesController < ApplicationController
  before_filter :require_sign_in

  def new
    @question = Question.find_unanswered(current_user)
    if @question
      @response = @question.responses.new(user_id: current_user.id)
      render :new
    else
      flash[:notice] = "You've answered all of the questions"
      redirect_to user_url(current_user)
    end
  end

  def create ## add logic for a skip
    @response = current_user.responses.new(response_params)

    if @response.save
      redirect_to new_response_url
    else
      @question = params[:question_id] ##must be hidden in form
      flash[:notice] = @response.errors.full_messages
      render :new
    end
  end

  def update
    @response = current_user.responses.find(params[:id])
    @response.update(response_params)
    redirect_to :back
  end

  def destroy
    @response = Response.find(params[:id])
    @response.delete
    redirect_to :back
  end

  def response_params
    params.require(:response).permit(:answer_id, :explanation)
  end
end
