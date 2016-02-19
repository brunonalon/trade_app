class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :user_sender_id, :user_receiver_id
      t.timestamps
    end
  end
end
