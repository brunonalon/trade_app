class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    puts "LOCATION"
  #  puts location.inspect
    puts ip_address
    user.ip_address = ip_address
    user.save
    puts user.latitude
    puts user.longitude
    puts user.longitude.class
    session[:user_id] = user.id
    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
