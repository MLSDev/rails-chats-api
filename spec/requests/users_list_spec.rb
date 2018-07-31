require 'rails_helper'

RSpec.describe 'UsersList', type: :request do
  let!(:users) do
    create_list :user, 3, :with_auth_token, :with_expected_additional_columns
  rescue
    create_list :user, 3, :with_auth_token
  end

  describe 'Authorized' do
    let(:current_user) { users.sample }

    before { get '/users', params: {} , headers: authorized_headers(current_user.auth_token.value) }

    it { expect { JSON.parse response.body }.not_to raise_error }

    let(:parsed_response) { JSON.parse response.body }

    it do
      expect(parsed_response).to have_exactly(3).items
    end

    it do
      if parsed_response.map { |user| user.respond_to?(:[]) }.all?
        expect(parsed_response.map { |user| user['id'].to_i }).to match_array User.pluck(:id)
      end
    end

    it do
      if parsed_response.map { |user| user.respond_to?(:[]) }.all?
        expect(parsed_response.map { |user| user['name'] }).to match_array User.pluck(:name)
      end
    end

    it do
      if parsed_response.map { |user| user.respond_to?(:[]) }.all?
        expect(parsed_response.map { |user| user['email'] }).not_to match_array User.pluck(:email)
      end
    end

    it do
      if parsed_response.map { |user| user.respond_to?(:[]) }.all?
        expect(parsed_response.map { |user| user['password_digest'] }).not_to match_array User.pluck(:password_digest)
      end
    end

    it do
      if parsed_response.map { |user| user.respond_to?(:[]) }.all?
        expect(parsed_response.map { |user| user['created_at'] }).not_to match_array User.pluck(:created_at).map(&:iso8601)
      end
    end

    it do
      if parsed_response.map { |user| user.respond_to?(:[]) }.all?
        expect(parsed_response.map { |user| user['updated_at'] }).not_to match_array User.pluck(:updated_at).map(&:iso8601)
      end
    end

    it('returns HTTP Status Code 200') { expect(response).to have_http_status :ok }
  end

  describe 'Not Authorized' do
    before { get '/users', params: {} , headers: not_authorized_headers }

    it('returns HTTP Status Code 401') { expect(response).to have_http_status :unauthorized }
  end
end
