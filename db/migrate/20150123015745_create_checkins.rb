class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :latitude
      t.string :longitude
      t.text :note
      t.string :photo_url
      t.integer :checkinable_id
      t.string :checkinable_type
      t.references :user, index: true
      t.references :checkinable, index: true, polymorphic: true

      t.timestamps null: false
    end
    add_foreign_key :checkins, :users
  end
end
