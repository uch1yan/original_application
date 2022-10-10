class Kid < ApplicationRecord
  belongs_to :family
  has_many :growth_records, dependent: :destroy
  has_many :schedules, dependent: :destroy 
  mount_uploader :avatar, ImageUploader
end
