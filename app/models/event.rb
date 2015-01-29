class Event < ActiveRecord::Base

  has_many :checkins, as: :checkinable
  belongs_to :user
  belongs_to :location

end
