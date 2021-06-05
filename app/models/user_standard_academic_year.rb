class UserStandardAcademicYear < ApplicationRecord
  belongs_to :user
  belongs_to :standard

  validates :year, presence: true
end
