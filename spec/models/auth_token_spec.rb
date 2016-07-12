require 'rails_helper'

RSpec.describe AuthToken, type: :model do
  it { should callback(:assign_value).before(:create) }

  describe '#assign_value' do
    before { expect(SecureRandom).to receive(:uuid).and_return('xxxx-yyyy-zzzz') }

    before { expect(subject).to receive(:value=).with('xxxx-yyyy-zzzz') }

    it { expect { subject.send :assign_value }.to_not raise_error }
  end
end
