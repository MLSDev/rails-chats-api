class Session
  include ActiveModel::Validations

  def initialize params={}
    params = params&.symbolize_keys || {}

    @email = params[:email]

    @password = params[:password]
  end

  validate do |model|
    if user
      model.errors.add :password, 'is invalid' unless password?
    else
      model.errors.add :email, 'not found'
    end
  end

  private
  def user
    @user ||= User.find_by email: @email
  end

  def password?
    user.authenticate @password
  end
end
