FactoryBot.define do
  factory :post do
    association :user
    association :anime
    title { "Test" }
    body { "Test is interesting" }
    rate { "2" }
    anime_title { "日常" }
  end
end
