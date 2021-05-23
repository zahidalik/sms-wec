class School < ApplicationRecord
  validates :name, presence: true
  validates :head, presence: true

  has_many :standards

  has_many :user_schools
  has_many :users, through: :user_schools

  has_many :student_schools
  has_many :students, through: :student_schools

  extend FriendlyId
  friendly_id :name, use: :slugged
end
