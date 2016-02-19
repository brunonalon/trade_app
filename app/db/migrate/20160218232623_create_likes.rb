class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :item_offered_id, :item_like_id
      t.timestamps
    end
  end
end
