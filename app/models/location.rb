class Location < ActiveRecord::Base

  has_many :events
  has_many :checkins, as: :checkinable
  belongs_to :user

end
