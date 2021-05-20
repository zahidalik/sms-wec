class User < ApplicationRecord
  rolify
  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true
  validates :mobile,   presence: true

  has_secure_password

  has_many :user_standard_academic_years
  has_many :standards, through: :user_standard_academic_years

  extend FriendlyId
  friendly_id :username, use: :slugged

  after_create :assign_default_role
  def assign_default_role
    self.add_role(:teacher) if self.roles.blank?
  end

  validate :must_have_a_role, on: :update

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end
end
