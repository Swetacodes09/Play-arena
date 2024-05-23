
class SessionsController < ApplicationController
  def new
  end

 
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      if logged_in? && admin?
        redirect_to admin_dashboard_path
      else
        redirect_to sports_path
      end
    else
      flash[:alert] = 'Invalid email or password'
      flash.discard
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to sports_path, notice: 'Logged out!'
  end
end
