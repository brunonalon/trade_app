class Location < ActiveRecord::Base
<<<<<<< HEAD
  # geocoded_by :ip_address,
  #   :latitude,
  # # has_many :locatables, :polymorphic => true
  # # acts_as_mappable :default_units => :miles,
  # #                  :default_formula => :sphere,
  # #                  :distance_field_name => :distance,
  # #                  :lat_column_name => :lat,
  # #                  :lng_column_name => :lng
  has_one :user
  belongs_to :community

end
