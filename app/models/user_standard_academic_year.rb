class UserStandardAcademicYear < ApplicationRecord
  belongs_to :user
  belongs_to :standard
  has_many :user_subjects
  has_many :students, through: :standard
  has_many :student_subjects

  extend FriendlyId
  friendly_id :year, use: :slugged

  validates :year, presence: true
end
