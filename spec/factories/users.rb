FactoryBot.define do
  factory :user do
    email    { FFaker::Internet.email }

    password { FFaker::Internet.password }

    trait :with_auth_token do
      association :auth_token
    end

    trait :with_expected_additional_columns do
      name { FFaker::Internet.user_name }
    end
  end
end
