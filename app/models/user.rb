class User < ActiveRecord::Base

  has_many :checkins
  has_many :locations
  has_many :events
  has_many :events, :through => :locations

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  has_secure_password

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

  def self.game_score myId
    u = self.find_by_id(myId)

    ax = 10
    bx = 20
    cx = 30

    a = u.checkins.where(checkinable_type: 'Location').length
    b = 0
    c = u.checkins.where(checkinable_type: 'Event').length

    score = (a*ax)+(c*cx)
    puts score
  end

  # def self.game_score
    # u = User.find_by_id(user_id)
    # score is an array with count of each type of checkin + final tally

    # multipliers
    # ax = 10 # > checkin to existing loc
    # bx = 20 # > checkin to new loc
    # cx = 30 # > checkin to event

    # # counts
    # a = self.checkins.where(checkinable_type: 'Location').length
    # b = 0
    # c = self.checkins.where(checkinable_type: 'Event').length

    # # score = [
    # #             ckn_existing = a * ax,
    # #             ckn_new = b * bx,
    # #             ckn_event = c * cx,
    # #             total_score = :ckn_existing + :ckn_new + :ckn_event
    # #         ]
    # # # return score
    # puts a
  # end

end
