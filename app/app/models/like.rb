# class Like < ActiveRecord::Base
#   belongs_to :item_offered, :class_name => 'Item'
#   belongs_to :item_liked, :class_name => 'Item'
#   after_save :match?
#
#   def match?
#     #search likes for inverse of item ids
#     result = Like.where(:item_offered=>self.item_liked).where(:item_liked=>self.item_offered)
#     #if results > 0, then insert a match in the matches table
#     Match.create(item_offered: self.item_offered, item_liked: self.item_liked) if result.length > 0
#   end
# end

class Like < ActiveRecord::Base

  belongs_to :offered, foreign_key: 'item_offered_id', :class_name => 'Item'
  belongs_to :like, foreign_key: 'item_like_id', :class_name => 'Item'

end
