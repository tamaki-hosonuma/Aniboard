FactoryBot.define do
  factory :comment do
    association :post
    body { "MyText" }
    user { post.user }
  end
end
