class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "Welcome back #{user.name}"
    else
      redirect_to '/login', notice: "Please fill out all required fields"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

