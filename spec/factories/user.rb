FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'user_1' }
    email { 'user_1r@example.com' }
    password { 'password1' }
    password_confirmation { "password1" }
  end
  factory :second_user, class:User do
    id { 1 }
    name { 'user_1' }
    email { 'user_1r@example.com' }
    password { 'password1' }
    password_confirmation { "password1" }
  end
  factory :admin, class: User do
    id { 2 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'passwordadmin' }
    password_confirmation { "passwordadmin" }
    admin { true }
  end
end
