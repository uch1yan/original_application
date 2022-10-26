# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "dive",
  email: "dive@example.com",
  password: "password",
  admin: true,
  id: 101
)

User.create!(
  name: "dive2",
  email: "dive2@com",
  password: "password",
  admin: false,
  id: 102
)


User.create!(
  name: "dive3",
  email: "dive3@com",
  password: "password",
  admin: false,
  id: 103
)

User.create!(
  name: "dive4",
  email: "dive4@com",
  password: "password",
  admin: false,
  id: 104
)

User.create!(
  name: "dive5",
  email: "dive5@com",
  password: "password",
  admin: false,
  id: 105
)


Family.create!(
  name: "Young",
  id: 101
)

Family.create!(
  name: "code2",
  id: 102
)

Family.create!(
  name: "code3",
  id: 103
)

Family.create!(
  name: "code4",
  id: 104
)

Family.create!(
  name: "code5",
  id: 105
)

Kid.create!(
  kid_name: "Taro",
  date_of_birth: "2022-12-01",
  id: 101,
  family_id: 101
)

Kid.create!(
  kid_name: "Hanako",
  date_of_birth: "2022-02-01",
  id: 102,
  family_id: 102
)

Kid.create!(
  kid_name: "Hikaru",
  date_of_birth: "2022-03-01",
  id: 103,
  family_id: 103
)

Kid.create!(
  kid_name: "Toshi",
  date_of_birth: "2022-04-01",
  id: 104,
  family_id: 104
)

Kid.create!(
  kid_name: "Momo",
  date_of_birth: "2022-05-01",
  id: 105,
  family_id: 105
)

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 101
)

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 101
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 102
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 103
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: 104
)


GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: 105
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 101
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 102
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 103
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 104
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: 105
)


Schedule.create!(
  start_time: "2022-12-01",
  title: "お遊戯会",
  content: "衣装を買いに行く",
  kid_id: 101
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "保育園",
  content: "誕生日会",
  kid_id: 102
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "写真撮影",
  content: "100日記念の撮影",
  kid_id: 103
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "お弁当会",
  content: "キャラ弁を作る",
  kid_id: 104
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "身体測定",
  content: "1か月検診",
  kid_id: 105
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 101
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 102
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 103
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 104
)

GrowthRecord.create!(
  date: "2022-12-10",
  height: 100,
  weight: 20,
  kid_id: 105
)

Group.create!(
  user_id: 101,
  family_id: 101
)

Group.create!(
  user_id: 102,
  family_id: 102
)

Group.create!(
  user_id: 103,
  family_id: 103
)

Group.create!(
  user_id: 104,
  family_id: 104
)

Group.create!(
  user_id: 105,
  family_id: 105
)

VaccinationRecord.create!(
  name: "ヒブ",
  name: "B型肝炎",
  name: "小児用肺炎球菌",
  name: "ロタウイルス"
)