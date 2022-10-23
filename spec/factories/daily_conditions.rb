FactoryBot.define do
  factory :daily_condition do
    start_time { "2022-10-01" }
    mood { "良い" }
    temperature { "37.5" }
    toilet { "快便" }
    sleep { "8時間" }
    comment { "機嫌が良かった"}
    kid { FactoryBot.create(:kid)}
  end
end
