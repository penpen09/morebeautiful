# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = Faker::JapaneseMedia::OnePiece.character
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false
               )
end

User.create!(name: "Admin",
             email: "admin@admin.com",
             password: 'password',
             password_confirmation: 'password',
             admin: true
             )

10.times do |n|
  User.create!(name: "test_user#{n+1}",
               email: "user#{n+1}@dic.com",
               password: "password#{n+1}",
               password_confirmation: "password#{n+1}",
               admin: false
              )
end

3.times do |n|
  Event.create!(title: "ハロウィンメイク",
                content: "ゾンビのメイクをしたい人向けです",
                event_date: DateTime.new(2020,10,25,12,00,00),
                place: "オフライン",
                fee: 0,
                contact: "zoomのurlはこちら",
                user_id: 10
               )
end

3.times do |n|
  Event.create!(title: "秋にぴったりのメイク",
                content: "秋にあうオレンジメイク",
                event_date: DateTime.new(2020,10,20,15,00,00),
                place: "東京都渋谷区",
                fee: 100,
                contact: "オレンジ色のアイシャドウがあればご準備ください",
                user_id: 15
               )
end

3.times do |n|
  Event.create!(title: "クリスマスメイク",
                content: "クリスマスデートにあうメイク",
                event_date: DateTime.new(2020,12,20,10,30,00),
                place: "オフライン",
                fee: 1000,
                contact: "zoomのurlはこちら",
                user_id: 5
               )
end

3.times do |n|
  Event.create!(title: "毎日メイク",
                content: "仕事に行く時のナチュラルメイク",
                event_date: DateTime.new(2020,11,01,11,00,00),
                place: "横浜市",
                fee: 500,
                contact: "感想を待ってます",
                user_id: 8
               )
end
