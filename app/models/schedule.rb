class Schedule < ApplicationRecord
  belongs_to :kid
  validates :date, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
