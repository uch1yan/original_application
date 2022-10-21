class VaccinationRecord < ApplicationRecord
  has_many :kid_vaccination_records, dependent: :destroy
  has_many :kids, through: :kid_vaccination_records
  enum name: { 小児用肺炎球菌: 0, ヒブ: 1, B型肝炎: 2, ロタウイルス: 3 }
end
