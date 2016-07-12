class AuthToken < ActiveRecord::Base
  before_create :assign_value

  private
  def assign_value
    self.value = SecureRandom.uuid
  end
end
