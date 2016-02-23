class User < ActiveRecord::Base
  attr_accessor :ip_address

  has_many :items
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :liked_items, through: :likes, class_name: 'Item', source: :item
  has_many :disliked_items, through: :dislikes, class_name: 'Item', source: :item
  geocoded_by :ip_address   # can also be an IP address
  after_validation :geocode


  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.save
    end
  end

  # belongs_to :location, :as => :locatable
  # acts_as_mappable :through => :location

  # has_many :messages, foreign_key: "user_sender_id", class_name: "Message"
  # has_many :messages, foreign_key: "user_receiver_id", class_name: "Message"
  # has_many :sender, foreign_key: 'user_sender_id', :class_name => 'Message'
  # has_many :user_receiver_id, :class_name => 'Message'
end
