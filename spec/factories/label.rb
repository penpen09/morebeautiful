FactoryBot.define do
  factory :label do
    name { '顔' }
  end
  factory :label2, class: Label do
    name { '口もと' }
  end
  factory :label3, class: Label do
    name { '目もと' }
  end
  factory :label4, class: Label do
    name { 'ほお' }
  end
  factory :label5, class: Label do
    name { '輪郭' }
  end
end
