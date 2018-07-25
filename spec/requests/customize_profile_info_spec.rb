# require 'rails_helper'

# RSpec.describe 'CustomizeProfileInfo', type: :request do

#   let(:user) { User.create attrs }

#   let(:attrs) { { password: 'test', email: 'test@test.com', name: 'name', password_confirmation: 'test' } }

#   let(:user_response) { { email: user.email } }

#   let(:token) { AuthToken.create(user_id: user.id) }

#   let(:value) { token.value }

#   let(:headers) { { 'Authorization' => "Token #{value}", 'Content-type' => 'application/json' } }

#   before { get '/profile', params: {} , headers: headers }

#   context 'with valid params' do
#     it('returns authenticated user') { expect(response.body).to eq user_response.to_json }

#     it('returns HTTP Status Code 200') { expect(response).to have_http_status 200 }
#   end

#   context 'with invalid params' do
#     let(:value) { 'another_token' }

#     it('returns HTTP Status Code 401') { expect(response).to have_http_status 401 }

#     it('returns "HTTP Token: Access denied."') { expect(response.body).to eq "HTTP Token: Access denied.\n" }

#     it('returns header "WWW-Authenticate"') { expect(response.header['WWW-Authenticate']).to eq "Token realm=\"Application\"" }
#   end
# end
