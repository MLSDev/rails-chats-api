require 'rails_helper'

RSpec.describe 'CustomizeProfileInfo', type: :request do
  let(:user) { create(:user)}

  let(:token) { AuthToken.create(user_id: user.id) }

  let(:value) { token.value }

  let(:headers) { { 'Authorization' => "Token token=#{value}", 'Content-type' => 'application/json', 'Accept' => 'application/json' } }

  before { delete '/session', params: {} , headers: headers }

  context 'with valid params' do
    it("destroys current_user's auth_token") { expect(user.auth_token).to eq nil }

    it('returns HTTP Status Code 204') { expect(response).to have_http_status 204 }
  end

  context 'with invalid params' do
    let(:value) { 'another_token' }

    it('returns HTTP Status Code 401') { expect(response).to have_http_status 401 }

    it('returns "HTTP Token: Access denied."') { expect(response.body).to eq "HTTP Token: Access denied.\n" }

    it('returns header "WWW-Authenticate"') { expect(response.header['WWW-Authenticate']).to eq "Token realm=\"Application\"" }
  end
end
