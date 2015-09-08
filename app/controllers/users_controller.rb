class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
       session[:user_id] = user.id
       redirect_to root_path, notice: "Welcome #{params[:user][:name]}"
    else
       redirect_to '/signup', notice: "Please fill out all required fields"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
