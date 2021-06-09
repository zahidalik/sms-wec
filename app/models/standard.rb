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

  def with_student_standard_academic_year(student, standard)
    student_standard_academic_years.where("student_id = :student_id AND standard_id = :standard_id", student_id: student.id, standard_id: standard.id).first.year
  end

  def with_user_standard_academic_year(user, standard)
    user_standard_academic_years.where("user_id = :user_id AND standard_id = :standard_id", user_id: user.id, standard_id: standard.id).first.year
  end
end
