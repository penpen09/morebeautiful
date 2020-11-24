# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do |n|
#   name = Faker::JapaneseMedia::OnePiece.character
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                admin: false
#                )
# end

# User.create!(name: "Admin",
#              email: "admin@admin.com",
#              password: 'password',
#              password_confirmation: 'password',
#              admin: true
#              )

5.times do |n|
  User.create!(name: "test_user#{n+1}",
               email: "user#{n+1}@dic.com",
               password: "password#{n+1}",
               password_confirmation: "password#{n+1}",
               admin: false
              )
end

Label.create(name: "顔")
Label.create(name: "口もと")
Label.create(name: "目もと")
Label.create(name: "ほお")
Label.create(name: "輪郭")
Label.create(name: "鼻")
Label.create(name: "その他")

User.all.each do |user|
  user.events.create!(
    title: 'クリスマスのメイク',
    content: 'クリスマスの特別な日に特別なメイクを！使用コスメはRMKの・・・・・',
    event_date: '2020-12-17 16:20:00',
    place: 'オフライン',
    fee: 0,
    contact: 'zoomのurlはこちら',
    image: File.open("./app/assets/images/sample.jpg"),
    user_id: user.id
  )
end

User.all.each do |user|
  user.events.create!(
    title: 'プチプラで毎日メイク',
    content: 'プチプラコスメを使用した簡単時短メイクを教えます！',
    event_date: '2021-01-10 13:00:00',
    place: 'オフライン',
    fee: 0,
    contact: 'zoomのurlはこちら',
    image: File.open("./app/assets/images/sample2.jpg"),
    user_id: user.id
  )
end

User.all.each do |user|
  user.posts.create!(
    title: '大人メイク',
    content: 'ナチュラルな大人メイクはこのやり方！',
    cosmetic: 'RMK、セザンヌ、KATE',
    youtube_url: 'https://youtu.be/X48AvIuhD24',
    image: File.open("./app/assets/images/sample_post1.jpg"),
    user_id: user.id
  )
end

# 3.times do |n|
#   Event.create!(title: "ハロウィンメイク",
#                 content: "ゾンビのメイクをしたい人向けです",
#                 event_date: '2021-01-15 10:00:00',
#                 place: "オフライン",
#                 fee: 0,
#                 contact: "zoomのurlはこちら",
#                 user_id: User.first
#                )
# end
#
# 3.times do |n|
#   Event.create!(title: "秋にぴったりのメイク",
#                 content: "秋にあうオレンジメイク",
#                 event_date: '2020-11-15 15:30:00',
#                 place: "東京都渋谷区",
#                 fee: 100,
#                 contact: "オレンジ色のアイシャドウがあればご準備ください",
#                 user_id: User.last
#                )
# end
#
