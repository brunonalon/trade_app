class Match < ActiveRecord::Base
  belongs_to :item_offered, :class_name => 'Item'
  belongs_to :item_liked, :class_name => 'Item'
end
