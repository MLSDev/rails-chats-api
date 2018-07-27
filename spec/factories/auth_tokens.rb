FactoryBot.define do
  factory :auth_token do
    value { SecureRandom.uuid }
  end
end
