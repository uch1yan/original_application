FactoryBot.define do
  factory :family do
    name { "family1" }
  end

  factory :second_family, class: Family do
    name { "family2" }
  end
end
