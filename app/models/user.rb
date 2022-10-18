class User < ApplicationRecord
  has_many :checks, dependent: :destroy
  has_many :check_vaccination_records, through: :checks, source: :vaccination_record
  has_many :comments
  has_many :groups, dependent: :destroy
  has_many :families, through: :groups, source: :family
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 10 }
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
