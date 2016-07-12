require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe '#create.json' do
    let(:user) { double }

    let(:params) { { 'email' => 'kathy@hartlova.com', 'password' => 'bigboobs', 'password_confirmation' => 'bigboobs' } }

    before { expect(User).to receive(:new).with(params).and_return(user) }

    context do
      before { expect(user).to receive(:save).and_return(true) }

      before { post :create, user: params, format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(user).to receive(:save).and_return(false) }

      before { post :create, user: params, format: :json }

      it { should render_template :errors }
    end
  end

  context do
    let(:user) { double }

    before { sign_in user }

    describe '#show.json' do
      before { get :show, format: :json }

      it { should render_template :show }

      its(:resource) { should eq user }
    end
  end
end
