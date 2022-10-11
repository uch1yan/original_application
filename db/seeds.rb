# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vaccination_record.create(name: "モデルナ", count: '一回目', :expected_date: '生後一ヶ月', count: '二回目', :expected_date: '生後三ヶ月',count: '三回目', :expected_date: '生後六ヶ月',)
vaccination_record.create(name: "ファイザー", count: '一回目', :expected_date: '生後一ヶ月', count: '二回目', :expected_date: '生後三ヶ月',count: '三回目', :expected_date: '生後六ヶ月',)
vaccination_record.create(name: "オミクロン", count: '一回目', :expected_date: '生後一ヶ月', count: '二回目', :expected_date: '生後三ヶ月',count: '三回目', :expected_date: '生後六ヶ月',)