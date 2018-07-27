class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  attr_reader :current_user, :current_auth_token_value

  helper_method :collection, :resource

  before_action :authenticate!

  rescue_from ActionController::ParameterMissing do |exception|
    @exception = exception

    render :exception, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do
    @exception = 'Not Found'

    render :exception, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  def create
    render :errors unless resource.save
  end

  private

  def authenticate!
    authenticate_or_request_with_http_token do |token, options|
      @current_auth_token_value = token

      @current_user = User.joins(:auth_token).find_by auth_tokens: { value: token }
    end
  end

  def authenticate
    authenticate_with_http_token do |token, options|
      @current_auth_token_value = token

      @current_user = User.joins(:auth_token).find_by auth_tokens: { value: token }
    end
  end

  def current_auth_token
    @current_auth_token ||= AuthToken.find_by_value current_auth_token_value
  end
end
