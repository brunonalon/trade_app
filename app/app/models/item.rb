class Item < ActiveRecord::Base
  belongs_to :user
  has_many :offered, foreign_key: 'item_offered_id', :class_name => 'Like'
  has_many :like, foreign_key: 'item_like_id', :class_name => 'Like'

  mount_uploader :picture_url, ImageUploader

  def get_match_items
    match_items = []
    likes = self.offered.all
    likes.each {|like|
      item_liked = like.like
      match_items << item_liked unless item_liked.offered.where('item_like_id = ?', self.id).empty?
    }
    match_items
  end

  def get_all_items_that_like_me
    items = []
    self.like.each{|like|
      items << like.offered
    }
    items
  end
end
