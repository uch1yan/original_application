FactoryBot.define do
  factory :group do
    user { FactoryBot.create(:user)}
    family { FactoryBot.create(:family)}
  end

  factory :second_group, class: Group do
    user { FactoryBot.create(:user2)}
    family { FactoryBot.create(:family2)}
  end
end
