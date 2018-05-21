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

    it 'raises an error when balance is above £90' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      error = "Balance cannot be above £ #{Oystercard::MAXIMUM_BALANCE}"
      expect { subject.top_up(1) }.to raise_error error
    end
  end
end
