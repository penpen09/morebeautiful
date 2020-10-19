FactoryBot.define do
  factory :event do
    title { 'メイク' }
    content { 'メイクコンテント' }
    place { 'オフライン' }
    fee { 1000 }
    event_date { "2020-10-30 09:00:00" }
    user_id { 1 }
  end
  factory :event2, class: Event do
    title { 'メイク2' }
    content { 'メイクコンテント2' }
    place { '東京都内' }
    fee { 0 }
    event_date { "2020-11-30 09:00:00" }
    user_id { 2 }
  end
end
