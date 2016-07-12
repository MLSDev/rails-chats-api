require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create.json' do
    before { @session = double }

    before { expect(Session).to receive(:new).with(email: 'kathy@hartlova.com', password: 'bigboobs').and_return(@session) }

    context do
      before { expect(@session).to receive(:save).and_return(true) }

      before { post :create, session: { email: 'kathy@hartlova.com', password: 'bigboobs' }, format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(@session).to receive(:save).and_return(false) }

      before { post :create, session: { email: 'kathy@hartlova.com', password: 'bigboobs' }, format: :json }

      it { should render_template :errors }
    end
  end
end
