class Item < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :matches, foreign_key: "item_offered_id", dependent: :destroy
  mount_uploader :picture_url, ImageUploader

  def get_all_item_matches
    item_matches = Match.where("item_offered_id = ? or item_liked_id = ?", self.id, self.id)
    item_matches
  end
end
