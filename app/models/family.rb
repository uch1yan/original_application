class Family < ApplicationRecord
  validates :name, presence: true
  has_many :kids, dependent: :destroy
  has_many :groups, dependent: :destroy
end
