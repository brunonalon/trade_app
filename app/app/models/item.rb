class Item < ActiveRecord::Base
  belongs_to :user
  has_many :item_offered_id, :class_name => 'Like'
  has_many :item_like_id, :class_name => 'Like'
  mount_uploader :picture_url, ImageUploader
end
