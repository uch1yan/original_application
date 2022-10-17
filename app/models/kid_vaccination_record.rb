class KidVaccinationRecord < ApplicationRecord
  belongs_to :kid
  belongs_to :vaccination_record
  enum count: { '1回目': 0, '2回目': 1, '3回目': 2, '4回目': 3, '5回目': 4 }
end
