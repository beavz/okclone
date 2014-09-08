class UsersController < ApplicationController
  def show
    if require_sign_in
      @user = User.find(params[:id])
      if @user == current_user
        render :show_self
      else
        render :show
      end
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
      redirect_to "#{root_url}/#/users/#{@user.id}"
    else
      flash[:now] = @user.errors.full_messages
      render :new
    end
  end

  def index
    if require_sign_in
      @users = User.all #change this to current_user.close_users later

      render :index
    end
  end

  def update
    if require_sign_in
      @user = current_user

      unless @user.update(user_params)
        flash[:now] = @user.errors.full_messages
      end

      render :show_self
    end
  end

  private

  def user_params
    params.require(:user).permit! ### NOT SAFE COME BACK HERE SOON
  end
end
