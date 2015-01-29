class AddPhoneAndHoursAndWebsiteToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :phone_num, :string
    add_column :locations, :hours, :string
    add_column :locations, :website, :string
  end
end
