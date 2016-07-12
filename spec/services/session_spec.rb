require 'rails_helper'

RSpec.describe Session do
  subject { Session.new email: 'kathy@hartlova.com', password: 'bigboobs' }

  describe '#user' do
    before { expect(User).to receive(:find_by).with(email: 'kathy@hartlova.com').and_return(:user) }

    its(:user) { should eq :user }
  end

  describe '#password?' do
    let(:user) { double }

    before { expect(subject).to receive(:user).and_return(user) }

    context do
      before { expect(user).to receive(:authenticate).with('bigboobs').and_return(true) }

      its(:password?) { should eq true }
    end

    context do
      before { expect(user).to receive(:authenticate).with('bigboobs').and_return(false) }

      its(:password?) { should eq false }
    end
  end

  describe '#valid?' do
    let(:session) { Session.new email: 'kathy@hartlova.com', password: 'bigboobs' }

    subject { session.errors }

    context do
      before { expect(session).to receive(:user) }

      before { session.valid? }

      its([:email]) { should eq ['not found'] }
    end

    context do
      before { expect(session).to receive(:user).and_return(:user) }

      before { expect(session).to receive(:password?).and_return(false) }

      before { session.valid? }

      its([:password]) { should eq ['is invalid'] }
    end
  end
end
