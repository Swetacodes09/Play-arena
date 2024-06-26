# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to sports_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    session[:user_id] = nil
    redirect_to sports_path, notice: 'Logged out!'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end
end
