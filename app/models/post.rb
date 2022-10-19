class Post < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :content, presence: true
end
