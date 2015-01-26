class ChangeLatLongToFloatInCheckins < ActiveRecord::Migration
  def change
    remove_column :checkins, :latitude
    remove_column :checkins, :longitude
    add_column :checkins, :latitude, :float
    add_column :checkins, :longitude, :float
  end
end
