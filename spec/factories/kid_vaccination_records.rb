FactoryBot.define do
  factory :kid_vaccination_record do
    count { '1回目' }
    inplemented_date { '2022/12/01' }
    kid { FactoryBot.create(:kid)}
    vaccination_record { FactoryBot.create(:vaccination_record)}
  end

  # factory :second_kid_vaccination_record do
  #   count { '1回目' }
  #   inplemented_date { '2022/02/01' }
  #   association :kid, factory: :kid
  # end
end

