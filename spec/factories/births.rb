FactoryBot.define do
  factory :birth do
    association :user
    plan_name           { '花子のバースプラン' }
    thought             { '素敵なお産にしたい' }
    hope_id             { 2 }
    attend_id           { 2 }
    contraction         { '好きな音楽を流したい' }
    childbirth          { '家族写真を撮る' }
    breastfeeding_id    { 2 }
    postpartum          { '母乳育児がしたい' }
    memo                { '持ち物' }
  end
end
