class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :require_login

  def index
  end

  private

  def logged_in?
    !!current_user
    #!!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id])
  end

  def require_login
   redirect_to login_path unless logged_in?
  end

end
