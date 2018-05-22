require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  context '#balance' do
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

  xdescribe '#deduct' do
    it 'deducts money from the balance' do
      expect { card.deduct(50) }.to change { card.balance }.by(-50)
    end
  end

  describe '#touch_in' do
    it 'changes status touch in' do
      card.top_up(2)
      card.touch_in(entry_station)
      expect(card).to be_in_journey
    end
    it 'minimum balance' do
      expect { card.touch_in(entry_station) }.to raise_error 'insufficent balance'
    end
    it 'holding entry station' do
      expect(card.journey_history).to be {}
      card.top_up(2)
      card.touch_in(entry_station)
      expect(card.journey_history[:entry]).to be entry_station
    end
  end

  describe '#in_journey' do
    it "checking in_journey status" do
      p card.journey_history
      expect(card).to_not be_in_journey
      card.top_up(2)
      card.touch_in(entry_station)
      expect(card).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'changes status touch out' do
      card.top_up(2)
      card.touch_in(entry_station)
      expect { card.touch_out(exit_station) }.to change { card.balance }.by (-Oystercard::FARE)
      expect(card).to_not be_in_journey
    end
    it 'leaving entry station' do
      card.top_up(2)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.journey_history[:exit]).to be exit_station
    end
  end

  it 'journey history' do
    expect(card.journey_history).to be {}
    card.top_up(2)
    card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(card.journey_history[:entry]).to be entry_station
    expect(card.journey_history[:exit]).to be exit_station
  end
end
