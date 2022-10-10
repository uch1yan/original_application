class Kid < ApplicationRecord
  belongs_to :family
  has_many :growth_records, dependent: :destroy
end
