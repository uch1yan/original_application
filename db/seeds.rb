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
  id: 1
)

User.create!(
  name: "dive2",
  email: "dive2@com",
  password: "password",
  admin: true,
  id: 2
)


User.create!(
  name: "dive3",
  email: "dive3@com",
  password: "password",
  admin: true,
  id: 3
)

User.create!(
  name: "dive4",
  email: "dive4@com",
  password: "password",
  admin: true,
  id: 4
)

User.create!(
  name: "dive5",
  email: "dive5@com",
  password: "password",
  admin: true,
  id: 5
)


Family.create!(
  name: "Young",
  id: 1
)

Family.create!(
  name: "code2",
  id: 2
)

Family.create!(
  name: "code3",
  id: 3
)

Family.create!(
  name: "code4",
  id: 4
)

Family.create!(
  name: "code5",
  id: 5
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

Kid.create!(
  kid_name: "Hikaru",
  date_of_birth: "2022-03-01",
  id: 3,
  family_id: 3
)

Kid.create!(
  kid_name: "Toshi",
  date_of_birth: "2022-04-01",
  id: 4,
  family_id: 4
)

Kid.create!(
  kid_name: "Momo",
  date_of_birth: "2022-05-01",
  id: 5,
  family_id: 5
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

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 1
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 2
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 3
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 4
)


GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: 5
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 1
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 2
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 3
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 4
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 5
)


Schedule.create!(
  start_time: "2022-12-01",
  title: "お遊戯会",
  content: "衣装を買いに行く",
  kid_id: 1
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "保育園",
  content: "誕生日会",
  kid_id: 2
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "写真撮影",
  content: "100日記念の撮影",
  kid_id: 3
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "お弁当会",
  content: "キャラ弁を作る",
  kid_id: 4
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "身体測定",
  content: "1か月検診",
  kid_id: 5
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 1
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 2
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 3
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 4
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 5
)

Group.create!(
  user_id: 1,
  family_id: 1
)

Group.create!(
  user_id: 2,
  family_id: 2
)

Group.create!(
  user_id: 3,
  family_id: 3
)

Group.create!(
  user_id: 4,
  family_id: 4
)

Group.create!(
  user_id: 5,
  family_id: 5
)