# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vaccination_record.create(name: "ヒブ")
vaccination_record.create(name: "B型肝炎")
vaccination_record.create(name: "小児用肺炎球菌")
vaccination_record.create(name: "ロタウイルス")

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた"
)

5.times do |n|
  Family.create!(
    name: "Family#{n + 1}"
  )

GrowthRecord.create!(
  date: "2022-12-01",
  height: "100",
  weight: "15"
)

Kid.create!(
  kid_name: "Kid#{n + 1}"
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い"
)

Schedule.create!(
  title: "お遊戯会",
  content: "衣装を買いに行く"
)

User.create!(
  name: "user#{n + 1}",
)