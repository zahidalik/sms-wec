class Student < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :contact,   presence: true
  validates :full_name, presence: true

  has_secure_password

  has_many :student_standard_academic_years
  has_many :standards, through: :student_standard_academic_years

  has_many :student_schools
  has_many :schools, through: :student_schools

  extend FriendlyId
  friendly_id :username, use: :slugged
end
