class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :picture_profile_url
      t.integer :location_id
      t.timestamps
    end
  end
end
