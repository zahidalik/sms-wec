class StudentStandardAcademicYear < ApplicationRecord
  belongs_to :student
  belongs_to :standard
  has_many :user_subjects, through: :standard
  has_many :student_subjects
end