require 'rails_helper'

RSpec.describe 'SignOut', type: :request do
  let(:user) { create(:user)}

  let(:token) { AuthToken.create(user_id: user.id) }

  let(:value) { token.value }

  let(:headers) { { 'Authorization' => "Token token=#{value}", 'Content-type' => 'application/json', 'Accept' => 'application/json' } }

  before { delete '/session', params: {} , headers: headers }

  context do
    it("destroys current_user's auth_token") { expect(user.auth_token).to eq nil }

    it('returns HTTP Status Code 204') { expect(response).to have_http_status 204 }
  end
end
