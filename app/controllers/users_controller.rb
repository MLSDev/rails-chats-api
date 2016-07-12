class UsersController < ApplicationController
  private
  def resource
    @user ||= User.new resource_params
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
