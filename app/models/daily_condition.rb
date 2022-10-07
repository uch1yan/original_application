class DailyCondition < ApplicationRecord
  has_many :comments, dependent: :destroy
  enum mood: { 良い: 0, まあまあ: 1, 悪い: 2 }
	enum toilet: { 快便: 0, 柔らかめ: 1, 固め: 2, コロコロ: 3, 下痢: 4 }
end
