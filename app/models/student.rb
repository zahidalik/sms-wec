class Student < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :contact,   presence: true
  validates :full_name, presence: true

  has_secure_password
end
