class MttcSubjectsPool < ApplicationRecord
  belongs_to :mttc_subject

  extend FriendlyId
  friendly_id :academic_year, use: :slugged
end
