class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  has_many :events
  has_many :checkins, as: :checkinable
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

end
