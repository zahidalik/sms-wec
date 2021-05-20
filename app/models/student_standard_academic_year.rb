class StudentStandardAcademicYear < ApplicationRecord
  belongs_to :student
  belongs_to :standard
end
