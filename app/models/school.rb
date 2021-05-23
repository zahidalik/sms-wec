class School < ApplicationRecord
  validates :name, presence: true
  validates :head, presence: true

  has_many :standards

  extend FriendlyId
  friendly_id :name, use: :slugged
end
