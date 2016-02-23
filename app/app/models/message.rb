class Message < ActiveRecord::Base
  belongs_to :sender, foreign_key: 'user_sender_id' , :class_name => 'User'
  belongs_to :user_receiver_id, :class_name => 'User'
end
