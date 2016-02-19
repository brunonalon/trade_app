class Item < ActiveRecord::Base
  mount_uploader :picture_url, ImageUploader
end
