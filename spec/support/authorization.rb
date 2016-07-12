module Authorization
  def sign_in user=nil
    user ||= double

    allow(controller).to receive(:current_user).and_return(user)
  end
end
