class Item < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :matches, dependent: :destroy
  mount_uploader :picture_url, ImageUploader

end
