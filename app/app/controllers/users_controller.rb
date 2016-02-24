class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    puts "CREATING USER"
    puts request.location.city
    session[:user_id] = user.id
    redirect_to root_url
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
