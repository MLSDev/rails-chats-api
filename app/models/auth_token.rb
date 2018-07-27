class AuthToken < ApplicationRecord
  has_secure_token :value
end
