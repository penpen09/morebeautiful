FactoryBot.define do
  factory :event do
    name { 'user_1' }
    email { 'user_1r@example.com' }
    password { 'password1' }
    password_confirmation { "password1" }
  end
  factory :event2, class: Event do
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'passwordadmin' }
    password_confirmation { "passwordadmin" }
    admin { true }
  end
end
