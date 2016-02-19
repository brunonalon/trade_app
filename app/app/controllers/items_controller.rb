class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "item"
    end
  end

  def item_params
    params.require(:item).permit(:name, :picture_url)
  end
end