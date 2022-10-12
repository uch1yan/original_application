class VaccinationRecord < ApplicationRecord
  has_many :checks, dependent: :destroy
  has_many :check_users, through: :checks, source: :user
  acts_as_likeable
end
