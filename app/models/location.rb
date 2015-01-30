class Location < ActiveRecord::Base

  has_many :events
  has_many :checkins, as: :checkinable
  belongs_to :user

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, :reverse_geocode

    #avoid unnessary API Requests (only if address present or change since last change); ex:
    #after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    #http://www.rubydoc.info/github/alexreisner/geocoder/master/frames#Forward_and_Reverse_Geocoding_in_the_Same_Model

    def latlng
      [self.latitude, self.longitude]
    end

    def self.create_from_geocoder address
      results = Geocoder.search(address).first
      existing_item = self.where({
        latitude:results.latitude,
        longitude:results.longitude
        })
      if !existing_item.empty?
        existing_item.first
      else
      self.create({
        latitude:results.latitude,
        longitude:results.longitude,
        address_street:results.street_number+" "+results.route,
        address_city:results.city,
        address_state:results.state_code,
        address_zip:results.postal_code,
        address_country:results.country_code
        })
      end
    end

end
