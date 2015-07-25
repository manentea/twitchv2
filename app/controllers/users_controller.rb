class UsersController < ApplicationController
  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      render @user
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      render @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
