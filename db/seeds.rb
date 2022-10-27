# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(
  name: "dive",
  email: "dive@example.com",
  password: "password",
  admin: true,
)


user2 = User.create!(
  name: "dive2",
  email: "dive2@com",
  password: "password",
  admin: false,
)


user3 = User.create!(
  name: "dive3",
  email: "dive3@com",
  password: "password",
  admin: false,
)

user4 = User.create!(
  name: "dive4",
  email: "dive4@com",
  password: "password",
  admin: false,
)

user5 = User.create!(
  name: "dive5",
  email: "dive5@com",
  password: "password",
  admin: false,
)


fam1 = Family.create!(
  name: "Young",
)

fam2 = Family.create!(
  name: "code2",
)

fam3 = Family.create!(
  name: "code3",
)

fam4 = Family.create!(
  name: "code4",
)

fam5 = Family.create!(
  name: "code5",
)

kid1 = Kid.create!(
  kid_name: "Taro",
  date_of_birth: "2022-12-01",
  family_id: fam1.id
)

kid2 = Kid.create!(
  kid_name: "Hanako",
  date_of_birth: "2022-02-01",
  family_id: fam2.id
)

kid3 = Kid.create!(
  kid_name: "Hikaru",
  date_of_birth: "2022-03-01",
  family_id: fam3.id
)

kid4 = Kid.create!(
  kid_name: "Toshi",
  date_of_birth: "2022-04-01",
  family_id: fam4.id
)

kid5 = Kid.create!(
  kid_name: "Momo",
  date_of_birth: "2022-05-01",
  family_id: fam5.id
)

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: kid1.id
)

DailyCondition.create!(
  start_time: "2022-12-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: kid2.id
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: kid3.id
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: kid4.id
)

DailyCondition.create!(
  start_time: "2022-10-01",
  mood: "良い",
  temperature: "36.5",
  toilet: "快便",
  sleep: "7時間",
  comment: "よく眠ってくれた",
  kid_id: kid5.id
)


GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: kid1.id
)

GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: kid2.id
)

GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: kid3.id
)

GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: kid4.id
)

GrowthRecord.create!(
  date: "2022-10-01",
  height: "100",
  weight: "15",
  kid_id: kid5.id
)


Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: user1.id
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: user2.id
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: user3.id
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: user4.id
)

Post.create!(
  date: "2022-12-01",
  content: "月謝の支払い",
  user_id: user5.id
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "お遊戯会",
  content: "衣装を買いに行く",
  kid_id: kid1.id
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "保育園",
  content: "誕生日会",
  kid_id: kid2.id
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "写真撮影",
  content: "100日記念の撮影",
  kid_id: kid3.id
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "お弁当会",
  content: "キャラ弁を作る",
  kid_id: kid4.id
)

Schedule.create!(
  start_time: "2022-12-01",
  title: "身体測定",
  content: "1か月検診",
  kid_id: kid5.id
)

Group.create!(
  user_id: user1.id,
  family_id: fam1.id
)

Group.create!(
  user_id: user2.id,
  family_id: fam2.id
)

Group.create!(
  user_id: user3.id,
  family_id: fam3.id
)

Group.create!(
  user_id: user4.id,
  family_id: fam4.id
)

Group.create!(
  user_id: user5.id,
  family_id: fam5.id
)

VaccinationRecord.create!(name: "ヒブ")
VaccinationRecord.create!(name: "B型肝炎")
VaccinationRecord.create!(name: "小児用肺炎球菌")
VaccinationRecord.create!(name: "ロタウイルス")
