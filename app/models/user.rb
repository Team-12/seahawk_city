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

end
