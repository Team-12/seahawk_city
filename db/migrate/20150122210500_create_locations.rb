class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :name
      t.text :desc
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :address_country

      t.timestamps null: false
    end
  end
end
