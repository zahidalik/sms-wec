class StudentSchool < ApplicationRecord
  belongs_to :student
  belongs_to :school
end
