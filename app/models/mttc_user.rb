class MttcUser < ApplicationRecord
  has_secure_password
  
  has_many :designations, as: :designable

  extend FriendlyId
  friendly_id :username, use: :slugged

  def is_admin? 
    charge = designations.pluck("charge")
    !!charge.include?("Admin")
  end

  def is_teacher?
    charge = designations.pluck("charge")
    !!charge.include?("Teacher")
  end

  def is_class_teacher?
    charge = designations.pluck("charge")
    !!charge.include?("Class Teacher")
  end

  def add_designation(role)
    new_role = designations.build(charge: role)
    new_role.save
  end
end
