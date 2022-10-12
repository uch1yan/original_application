class VaccinationRecord < ApplicationRecord
  has_many :checks, dependent: :destroy
  has_many :check_users, through: :checks, source: :user
  enum name: { B型肝炎: 0, ロタウイルス: 1, ヒブ: 2, 小児用肺炎球菌: 3 }
	enum count: { '1回目': 0, '2回目': 1, '3回目': 2, '4回目': 3, '5回目': 4 }

end
