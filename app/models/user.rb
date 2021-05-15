class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true
  validates :mobile,   presence: true

  has_secure_password

  extend FriendlyId
  friendly_id :username, use: :slugged
end
