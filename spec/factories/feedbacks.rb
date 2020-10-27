FactoryBot.define do
  factory :feedback do
    feedback { "MyString" }
    received_via { "MyString" }
    category { "MyString" }
    tenant_name { "MyString" }
    opinion { "MyText" }
  end
end
