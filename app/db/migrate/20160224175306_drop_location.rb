class DropLocation < ActiveRecord::Migration
  def change
    drop_table :locations
    drop_table :communities
  end
end
