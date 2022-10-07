class Comment < ApplicationRecord
  belongs_to :daily_condition
  belongs_to :user, optional: true
  validates :content, presence: true
end
