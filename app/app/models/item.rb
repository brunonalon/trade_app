class Item < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :matches, foreign_key: "item_offered_id", dependent: :destroy
  mount_uploader :picture_url, ImageUploader

  def get_all_item_matches
    item_matches = self.matches.all
  end
end
