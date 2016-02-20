class User < ActiveRecord::Base
  has_many :items
  # has_many :messages, foreign_key: "user_sender_id", class_name: "Message"
  # has_many :messages, foreign_key: "user_receiver_id", class_name: "Message"
  has_many :sender, foreign_key: 'user_sender_id', :class_name => 'Message'
  has_many :user_receiver_id, :class_name => 'Message'
  belongs_to :location
end
