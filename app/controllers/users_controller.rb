class UsersController < ApplicationController
  def create
    if @user.find_by(params[:user][:username])
      session[:user_id] = @user.id
    else
      @user = User.create(user_params)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
