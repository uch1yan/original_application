class Family < ApplicationRecord
  validates :name, presence: true
  has_many :users, through: :groups, source: :user
  has_many :kids, dependent: :destroy
  has_many :groups, dependent: :destroy
end
