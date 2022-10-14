class KidVaccinationRecord < ApplicationRecord
  belongs_to :kid
  belongs_to :vaccination_record
end
