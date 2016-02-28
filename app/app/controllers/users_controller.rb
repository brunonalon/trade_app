class UsersController < ApplicationController
  respond_to :json, :html

  def new
    @user = User.new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  #  def index
  #    # @item = Item.new
  #    respond_with(@items = User.find(1).items)
  #  end
end
