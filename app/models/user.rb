class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true
  validates :mobile,   presence: true

  has_secure_password
end
