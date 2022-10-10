class Kid < ApplicationRecord
  has_many :growth_records, dependent: :destroy
end
