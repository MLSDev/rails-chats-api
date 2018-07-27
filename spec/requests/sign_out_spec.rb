require 'rails_helper'

RSpec.describe 'SignOut', type: :request do
  let!(:user) { create :user, :with_auth_token }

  context do
    before { delete '/session', params: {} , headers: authorized_headers(user.auth_token.value) }

    before { user.reload }

    it("destroys current_user's auth_token") { expect(user.auth_token).to be_nil }

    it('returns HTTP Status Code 204') { expect(response).to have_http_status :no_content }
  end

  context 'Unauthorized' do
    before { delete '/session', params: {} , headers: authorized_headers(FFaker::Code.ean) }

    before { user.reload }

    it('returns HTTP Status Code 204') { expect(response).to have_http_status :unauthorized }
  end
end
