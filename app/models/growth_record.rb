class GrowthRecord < ApplicationRecord
  belongs_to :kid, optional: true
end
