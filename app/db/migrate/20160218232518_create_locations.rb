class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :community_id
      t.decimal :latitude, :longitude
      t.timestamps
    end
  end
end
