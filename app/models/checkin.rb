class Checkin < ActiveRecord::Base

  belongs_to :user
  belongs_to :checkinable, polymorphic: true

end
