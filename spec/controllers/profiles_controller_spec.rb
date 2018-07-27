require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe '#create.json' do
    let(:password) { FFaker::Internet.password }

    let(:email) { FFaker::Internet.email }

    let(:user) { stub_model User }

    let(:params) { { user: { email: email, password: password, password_confirmation: password } } }

    let(:permitted_params) { permit_params! params, :user }

    before { expect(User).to receive(:new).with(permitted_params).and_return(user) }

    context do
      before { expect(user).to receive(:save).and_return(true) }

      before { post :create, params: params, format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(user).to receive(:save).and_return(false) }

      before { post :create, params: params, format: :json }

      it { should render_template :errors }
    end
  end

  context do
    let(:user) { stub_model User }

    before { sign_in user }

    describe '#show.json' do
      before { get :show, format: :json }

      it { should render_template :show }

      its(:resource) { should eq user }
    end
  end
end
