class Location < ActiveRecord::Base
  has_one :user
  belongs_to :community
end
