require 'oystercard'

describe Oystercard do

  context 'balance' do
    it 'checks balance' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top_up the balance' do
      expect { subject.top_up(50) }.to change { subject.balance }.by(50) 
    end
  end
end
