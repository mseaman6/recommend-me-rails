class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to recommendations_path
      end
    else
      flash[:message] = "Your sign up was unsuccessful, please re-enter your information and try again."
      redirect_to new_user_path
    end
  end

  def show
    require_login
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
