require 'rails_helper'

RSpec.describe 'UsersList', type: :request do
  let(:user) { create(:user)}

  let(:user_response) { User.all.map { |user| user.slice(:id, :name) } }

  let(:token) { AuthToken.create(user_id: user.id) }

  let(:value) { token.value }

  let(:headers) { { 'Authorization' => "Token token=#{value}", 'Content-type' => 'application/json', 'Accept' => 'application/json' } }

  before { get '/users', params: {} , headers: headers }

  context 'with valid params' do
    it('returns users collection') { expect(JSON.parse(response.body)).to eq user_response }

    it('returns HTTP Status Code 200') { expect(response).to have_http_status 200 }
  end

  context 'with invalid params' do
    let(:value) { 'another_token' }

    it('returns HTTP Status Code 401') { expect(response).to have_http_status 401 }

    it('returns "HTTP Token: Access denied."') { expect(response.body).to eq "HTTP Token: Access denied.\n" }

    it('returns header "WWW-Authenticate"') { expect(response.header['WWW-Authenticate']).to eq "Token realm=\"Application\"" }
  end
end
