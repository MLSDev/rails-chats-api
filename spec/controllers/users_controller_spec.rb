require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
end
