class Location < ActiveRecord::Base

  has_many :events
  has_many :checkins, as: :checkinable
  belongs_to :user

  # geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, :reverse_geocode

    #avoid unnessary API Requests (only if address present or change since last change); ex:
    #after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    #http://www.rubydoc.info/github/alexreisner/geocoder/master/frames#Forward_and_Reverse_Geocoding_in_the_Same_Model

end
