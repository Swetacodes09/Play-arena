class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user&.role == 'admin'
  end

  def require_admin
    return if admin?

    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to sign_in_path
  end

  def require_user
    redirect_to login_path unless logged_in?
  end
end
