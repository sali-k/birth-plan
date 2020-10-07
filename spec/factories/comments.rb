FactoryBot.define do
  factory :comment do
    association :user
    association :birth
    user_id             { 2 }
    birth_id            { 2 }
    content             { 'こんにちは' }
  end
end