class User < ApplicationRecord
  has_secure_password
 has_many :bookings
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }


  before_save :default_role

  private

  def default_role
    self.role ||= "user"
  end
end
