FactoryBot.define do
  factory :schedule do
    title { "お遊戯会" }
    content { "保育園でお遊戯会" }
    start_time { "2022-10-01 12:00:00" }
  end

  factory :second_schedule do
    title { "予防接種" }
    content { "水疱瘡の予防接種" }
    start_time { "2022-10-02 12:00:00" }
  end

end
