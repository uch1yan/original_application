class Family < ApplicationRecord
  validates :name, presence: true
  has_many :users, dependent: :destroy
  has_many :kids, dependent: :destroy
end
