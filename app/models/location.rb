class Location < ActiveRecord::Base
  # attr_accessible :latitude, :longitude

  has_many :events
  has_many :checkins, as: :checkinable
  belongs_to :user

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode

end
