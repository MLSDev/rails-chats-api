class ProfilesController < ApplicationController
  skip_before_action :authenticate!, only: :create

  before_action :build_resource, only: :create

  private
  def build_resource
    @user = User.new resource_params
  end

  def resource
    @user ||= current_user
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
