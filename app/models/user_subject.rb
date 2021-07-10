class UserSubject < ApplicationRecord
  belongs_to :user_standard_academic_year

  validates :name, presence: true
end
