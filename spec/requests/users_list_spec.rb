require 'rails_helper'

RSpec.describe 'UsersList', type: :request do
  let!(:users) do
    if ActiveRecord::Base.connection.column_exists?(:users, :name)
      create_list :user, 3, :with_auth_token, :with_expected_additional_columns
    else
      create_list :user, 3, :with_auth_token
    end
  end

  describe 'Authorized' do
    let(:current_user) { users.sample }

    before { get '/users', params: {} , headers: authorized_headers(current_user.auth_token.value) }

    it { expect { JSON.parse response.body }.not_to raise_error }

    it { expect(ActiveRecord::Base.connection.column_exists?(:users, :name)).to be_truthy }

    let(:parsed_response) { JSON.parse response.body }

    it do
      expect(parsed_response).to match([
        {
          id:   users.first.id,
          name: ( users.first.respond_to?(:name) ? users.first.name : 'NAME SHOULD NOT BE NIL!' ),
        },
        {
          id:   users.second.id,
          name: ( users.second.respond_to?(:name) ? users.second.name : 'NAME SHOULD NOT BE NIL!' ),
        },
        {
          id:   users.third.id,
          name: ( users.third.respond_to?(:name) ? users.third.name : 'NAME SHOULD NOT BE NIL!' ),
        }
      ])
    end

    it('returns HTTP Status Code 200') { expect(response).to have_http_status :ok }
  end

  describe 'Not Authorized' do
    before { get '/users', params: {} , headers: not_authorized_headers }

    it('returns HTTP Status Code 401') { expect(response).to have_http_status :unauthorized }
  end
end
