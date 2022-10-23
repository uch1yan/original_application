FactoryBot.define do
  factory :vaccination_record do
    name { 'ヒブ' }
  end

  factory :second_vaccination_record, class: VaccinationRecord do
    name { 'ロタウイルス' }
  end

end
