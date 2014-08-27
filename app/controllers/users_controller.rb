class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if @user = current_user
      render :show_self
    else
      render :show
    end
  end

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to user_url(current_user)
    else
      flash[:now] = @user.errors.full_messages
      render :new
    end
  end

  def index
    @user = User.all #change this to current_user.close_users later

    render :index
  end

  def update
    @user = current_user

    unless @user.update(user_params)
      flash[:now] = @user.errors.full_messages
    end

    render :show_self
  end

  private

  def user_params
    params.require(:user).permit! ### NOT SAFE COME BACK HERE SOON
  end
end
