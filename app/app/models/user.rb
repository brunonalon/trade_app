# class User < ActiveRecord::Base
#
#   attr_accessor :ip_address
#   has_many :items
#   has_many :liked_items, through: :likes, class_name: 'Item', source: :item
#   has_many :disliked_items, through: :dislikes, class_name: 'Item', source: :item
#   has_many :sender, foreign_key: 'user_sender_id', :class_name => 'Message'
#   has_many :receiver, foreign_key: 'user_receiver_id', :class_name => 'Message'
#   geocoded_by :ip_address   # can also be an IP address
#   after_validation :geocode
#
#   def self.from_omniauth(auth)
#     where(uid: auth.uid).first_or_create do |user|
#       user.uid      = auth.uid
#       user.name     = auth.info.name
#       user.save
#     end
#   end
#
#   def get_all_messages_by_user(user)
#     user1_id = self.id
#     user2_id = user.id
#     Message.where('(user_sender_id = ? and user_receiver_id = ?) or
#     (user_sender_id = ? and user_receiver_id = ?)', user1_id,user2_id,user2_id,user1_id).order('created_at')
#   end
#
# end

class User < ActiveRecord::Base

  attr_accessor :ip_address

  has_many :items
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :liked_items, through: :likes, class_name: 'Item', source: :item
  has_many :disliked_items, through: :dislikes, class_name: 'Item', source: :item
  has_many :sender, foreign_key: 'user_sender_id', :class_name => 'Message'
  has_many :receiver, foreign_key: 'user_receiver_id', :class_name => 'Message'
  geocoded_by :ip_address   # can also be an IP address
  after_validation :geocode


  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.save
    end
  end

  # def get_all_user_liked_items
  #   # liked_items = []
  #   # self.items.each{|item|
  #   #   liked_items << item unless item.like.empty?
  #   # }
  #   # liked_items
  #   items = Item.where('item_offered_id = ?', ).joins('JOIN likes ON likes.item_like_id = items.id')
  # end

  def get_all_messages_by_user(user)
    user1_id = self.id
    user2_id = user.id
    Message.where('(user_sender_id = ? and user_receiver_id = ?) or
    (user_sender_id = ? and user_receiver_id = ?)', user1_id,user2_id,user2_id,user1_id).order('created_at')
  end

end
