class MttcSubject < ApplicationRecord
  validates :name, :credits, :hours, presence: true

  has_many :mttc_subjects_pools

  extend FriendlyId
  friendly_id :name, use: :slugged
end
