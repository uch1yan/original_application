class GrowthRecord < ApplicationRecord
  validates :date, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  belongs_to :kid, optional: true
end
