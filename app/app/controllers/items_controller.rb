class ItemsController < ApplicationController
  respond_to :json, :html
  def index
    if current_user
      @item = current_user.items
      @item = Item.new unless @item
      respond_with(@item )
    else
      redirect_to root_url
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    end
  end

  def show
    redirect_to items_path
  end

  def item_params
    params.require(:item).permit(:name, :picture_url, :description, :user_id, :remote_picture_url_url)
  end
end
