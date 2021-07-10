class StudentSubject < ApplicationRecord
  belongs_to :student_standard_academic_year
  belongs_to :user_standard_academic_year

  validates :name, presence: true
end
