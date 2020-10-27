FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    image { "MyString" }
    cosmetic { "MyText" }
    youtube_url { "MyString" }
    user { nil }
  end
end
