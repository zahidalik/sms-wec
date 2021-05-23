class Standard < ApplicationRecord
  belongs_to :school
  has_many :user_standard_academic_years
  has_many :users, through: :user_standard_academic_years

  has_many :student_standard_academic_years
  has_many :students, through: :student_standard_academic_years

  validates :name, presence: true
  validates :section, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
