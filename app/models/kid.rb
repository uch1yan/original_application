class Kid < ApplicationRecord
  belongs_to :family
  has_many :daily_conditions, dependent: :destroy
  has_many :growth_records, dependent: :destroy
  has_many :schedules, dependent: :destroy 
  has_many :kid_vaccination_records, dependent: :destroy
  has_many :vaccine_records, through: :kid_vaccination_records, source: :vaccination_record
  validates :kid_name, presence: true
  validates :date_of_birth, presence: true
  validates :avatar, presence: true
  mount_uploader :avatar, ImageUploader
end
