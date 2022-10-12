class Schedule < ApplicationRecord
  belongs_to :kid
  validates :start_time, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
