class Location < ActiveRecord::Base

  has_many :events
  has_many :checkins, as: :checkinable
  belongs_to :user

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :populate_address,:if => :has_address_parts, :unless => :has_address
  after_validation :reverse_geocode, :if => :has_coordinates, :unless => :has_address
  after_validation :geocode, :if => :has_address, :unless => :has_coordinates

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


    private

    def has_coordinates
      !(self.latitude.blank? || self.longitude.blank?)
    end

    def has_address
      !self.address.blank?
    end

    def has_address_parts
      !(self.address_street.blank? || self.address_city.blank? || self.address_state.blank? || self.address_zip.blank?)
    end

    def populate_address
      self.address = "#{self.address_street}, #{self.address_city}, #{self.address_state} #{self.address_zip}"
    end

end
