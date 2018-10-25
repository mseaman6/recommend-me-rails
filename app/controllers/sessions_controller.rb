class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(auth) if auth
    user = User.find_by(:email => params[:user][:email]) if params[:user]
      if user && user.authenticate(params[:user][:password])
        @user = user
      end
    if @user
      session[:user_id] = @user.id
      redirect_to recommendations_path
    else
      flash[:message] = "Your login was unsuccessful, please re-enter your information and try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
