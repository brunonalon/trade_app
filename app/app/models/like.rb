class Like < ActiveRecord::Base

  belongs_to :offered, foreign_key: 'item_offered_id', :class_name => 'Item'
  belongs_to :like, foreign_key: 'item_like_id', :class_name => 'Item'

end
