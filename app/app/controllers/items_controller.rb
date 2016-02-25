class ItemsController < ApplicationController
  def index
    @item = Item.new
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
