FactoryBot.define do
  factory :user do
    name     { Faker::Internet.user_name } if User.new.attributes.symbolize_keys.include?(:name)

    email    { Faker::Internet.email }

    password { Faker::Internet.password }

    trait :with_auth_token do
      association :auth_token
    end
  end
end
