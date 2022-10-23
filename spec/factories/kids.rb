FactoryBot.define do
  factory :kid do
    kid_name { "kid1" }
    date_of_birth { "2022-01-01" }
    # association :kid_vaccination_records, factory: :kid_vaccination_record
  end

  factory :second_kid, class: Kid do
    kid_name { "kid2" }
    date_of_birth { "2022-01-02" }
    # association :kid_vaccination_records, factory: :kid_vaccination_record
  end
end
