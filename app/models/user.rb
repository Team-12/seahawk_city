class User < ActiveRecord::Base

  has_many :checkins
  has_many :events
  has_many :locations

  has_secure_password

  validates_confirmation_of :password on :create
  validates_presence_of :password_confirmation

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}


end
