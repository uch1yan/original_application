class VaccinationRecord < ApplicationRecord
  has_many :checks, dependent: :destroy
end
