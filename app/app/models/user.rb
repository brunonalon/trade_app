class User < ActiveRecord::Base
  has_many :items
  has_many :sender, foreign_key: 'user_sender_id', :class_name => 'Message'
  has_many :receiver, foreign_key: 'user_receiver_id', :class_name => 'Message'
  belongs_to :location

  def get_all_user_liked_items
    liked_items = []
    self.items.each{|item|
      liked_items << item unless item.like.empty?
    }
    liked_items
  end

  def get_all_messages_by_user(user)
    user1_id = self.id
    user2_id = user.id
    Message.where('(user_sender_id = ? and user_receiver_id = ?) or
      (user_sender_id = ? and user_receiver_id = ?)', user1_id,user2_id,user2_id,user1_id).order('created_at')
  end
end
