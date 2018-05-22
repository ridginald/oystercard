require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }

  context 'balance' do
    it 'checks balance' do
      expect(card.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top_up the balance' do
      expect { card.top_up(50) }.to change { card.balance }.by(50)
    end

    it 'raises an error when balance is above £90' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      error = "Balance cannot be above £ #{Oystercard::MAXIMUM_BALANCE}"
      expect { card.top_up(1) }.to raise_error error
    end
  end

  describe '#deduct' do
    it 'deducts money from the balance' do
      expect { card.deduct(50) }.to change { card.balance }.by(-50)
    end
  end
end
