require 'rails_helper'

RSpec.describe 'UsersList', type: :request do
  let(:user) { create(:user)}

  let(:user_response) { User.all.map { |user| user.slice(:id, :name) } }

  let(:token) { AuthToken.create(user_id: user.id) }

  let(:value) { token.value }

  let(:headers) { { 'Authorization' => "Token token=#{value}", 'Content-type' => 'application/json', 'Accept' => 'application/json' } }

  before { get '/users', params: {} , headers: headers }

  context do
    it('returns users collection') { expect(JSON.parse(response.body)).to eq user_response }

    it('returns HTTP Status Code 200') { expect(response).to have_http_status 200 }
  end
end
