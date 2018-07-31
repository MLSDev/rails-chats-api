require 'rails_helper'

RSpec.describe 'ProfileRequest', type: :request do
  let!(:user) do
    if ActiveRecord::Base.connection.column_exists?(:users, :name)
      create :user, :with_auth_token, :with_expected_additional_columns
    else
      create :user, :with_auth_token
    end
  end

  let(:headers) { authorized_headers user.auth_token.value }

  before { get '/profile', params: {} , headers: headers }

  context do
    it { expect { JSON.parse response.body }.not_to raise_error }

    let(:parsed_response) { JSON.parse response.body }

    it { expect(parsed_response['id']).to be_nil }

    it { expect(parsed_response['name']).to be_nil }

    it { expect(parsed_response['password_digest']).to be_nil }

    it { expect(parsed_response['created_at']).to be_nil }

    it { expect(parsed_response['updated_at']).to be_nil }

    it { expect(parsed_response['email']).to eq user.email }

    it('returns HTTP Status Code 200') { expect(response).to have_http_status :ok }
  end
end
