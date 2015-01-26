class AddUserIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :user_id, :int
  end
end
