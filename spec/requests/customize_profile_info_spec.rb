require 'rails_helper'

RSpec.describe 'CustomizeProfileInfo', type: :request do
  let(:user) { create(:user)}

  let(:user_response) { { "email" => user.email } }

  let(:token) { AuthToken.create(user_id: user.id) }

  let(:value) { token.value }

  let(:headers) { { 'Authorization' => "Token token=#{value}", 'Content-type' => 'application/json', 'Accept' => 'application/json' } }

  before { get '/profile', params: {} , headers: headers }

  context do
    it('returns authenticated user') { expect(JSON.parse(response.body)).to eq user_response }

    it('returns HTTP Status Code 200') { expect(response).to have_http_status 200 }
  end
end
