class User < ApplicationRecord
  has_many :comments
  has_many :groups, dependent: :destroy
  has_many :families, through: :groups, source: :family
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
  # validates :email, presence: true, length: { maximum: 255 }
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name ="ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: "guest_admin@example.com") do |user|
      user.name = "管理者ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

end
