class AddIsBusinessOwnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_business_owner, :boolean
  end
end
