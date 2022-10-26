# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "dive",
  email: "dive@com",
  password: "password",
  admin: true,
  id: 1,
)

Family.create!(
  name: "Young",
  id: 1
)

Family.create!(
  name: "中田",
  id: 2
)

Kid.create!(
  kid_name: "Taro",
  date_of_birth: "2022-12-01",
  id: 1,
  family_id: 1
)

Kid.create!(
  kid_name: "Hanako",
  date_of_birth: "2022-02-01",
  id: 2,
  family_id: 2
)

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 1
)


GrowthRecord.create!(
  date: "2022-12-01",
  height: "100",
  weight: "15",
  kid_id: 1
)

# 3.times do |n|
#   Kid.create!(
#     kid_name: "Kid#{n + 1}",
#     date_of_birth: "2022-01-01",
#   )
# end


Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  kid_id: 2
)

Schedule.create!(
  title: "お遊戯会",
  content: "衣装を買いに行く",
  kid_id: 2
)


Group.create!(
  user_id: 1,
  family_id: 1
)