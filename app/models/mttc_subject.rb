class MttcSubject < ApplicationRecord
  validates :name, :credits, :hours, presence: true

  has_many :mttc_subjects_pools
end
