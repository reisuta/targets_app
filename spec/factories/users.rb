FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "ユーザー#{ n }" }
    sequence(:email) { |n| "test#{ n }@example.com" }
    password { 'password' }
  end
end
