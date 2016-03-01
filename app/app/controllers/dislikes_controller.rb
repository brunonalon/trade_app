class DislikesController < ApplicationController
  respond_to :json, :html


  def create
    @dislike = Like.new({item_offered_id: params['item_offered_id'], item_liked_id: params['item_liked_id']})
    if @dislike.save
      render json: @dislike
    end
  end
end
