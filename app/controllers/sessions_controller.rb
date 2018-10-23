class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    render
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
