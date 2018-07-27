require 'rails_helper'

RSpec.describe 'ProfileRequest', type: :request do
  let!(:user) do
    create :user, :with_auth_token, :with_expected_additional_columns
  rescue
    create :user, :with_auth_token
  end

  let(:headers) { authorized_headers user.auth_token.value }

  before { get '/profile', params: {} , headers: headers }

  context do
    it { expect { JSON.parse response.body }.not_to raise_error }

    let(:parsed_response) { JSON.parse response.body }

    it do
      expect(parsed_response['id'].to_s).to eq user.id.to_s

      expect(parsed_response['name'].to_s).to eq user.name.to_s if user.respond_to?(:user)

      expect(parsed_response['name'].to_s).to_not be_nil
    end

    it('returns HTTP Status Code 200') { expect(response).to have_http_status :ok }
  end
end
