class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation && @user.save
    session[:user_id] = @user.id
    redirect_to 'welcome'
    else
      redirect_to '/users/new'
  end
end

  def welcome
    if session[:user_id]
      @user = User.find_by(session[:user_id])
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
