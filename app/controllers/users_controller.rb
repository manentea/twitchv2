class UsersController < ApplicationController

  def index
    @users = User.online_users
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      @user.update(status: true)
      @user.save
      render @user
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      @user.update(status: true)
      @user.save
      render @user
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(status: false)
    @user.save
    session[:user_id] = nil
    render :json => { status: 'logged out'}
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
