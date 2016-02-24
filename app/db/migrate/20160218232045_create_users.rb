class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :picture_profile_url
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :item
    end

    create_table :dislikes do |t|
      t.references :user
      t.references :item
    end
  end
end
