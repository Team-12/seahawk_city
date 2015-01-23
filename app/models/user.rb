class User < ActiveRecord::Base

  has_many :checkins
  has_many :events
  has_many :locations

end
