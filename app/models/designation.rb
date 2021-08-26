class Designation < ApplicationRecord
  belongs_to :designable, polymorphic: true
end
