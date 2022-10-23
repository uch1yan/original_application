FactoryBot.define do
  factory :group do
    user { FactoryBot.create(:user)}
    family { FactoryBot.create(:family)}
  end
end
