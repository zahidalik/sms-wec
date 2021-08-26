class MttcUser < ApplicationRecord
  has_secure_password

  extend FriendlyId
  friendly_id :username, use: :slugged
end
