class Standard < ApplicationRecord
  belongs_to :school
  has_many :user_standard_academic_years
  has_many :users, through: :user_standard_academic_years
end
