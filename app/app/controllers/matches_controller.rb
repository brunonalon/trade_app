class MatchesController < ApplicationController
  def index
    @users = current_user.get_all_user_conversations
    @items = current_user.get_all_user_items
    @conversations = Conversation.all
  end
  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end
  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
