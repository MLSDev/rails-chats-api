require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create.json' do
    let(:session) { double }

    let(:params) { { session: { email: 'kathy@hartlova.com', password: 'bigboobs' } } }

    let(:permitted_params) { permit_params! params, :session }

    before { expect(Session).to receive(:new).with(permitted_params).and_return(session) }

    context do
      before { expect(session).to receive(:save).and_return(true) }

      before { post :create, params: params, format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(session).to receive(:save).and_return(false) }

      before { post :create, params: params, format: :json }

      it { should render_template :errors }
    end
  end
end
