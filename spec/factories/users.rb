FactoryBot.define do
  factory :user do
    name {"test"}
    sequence(:email) { |n| "Test#{n}@example.com"}
    password {"testuser"}
  end
end
