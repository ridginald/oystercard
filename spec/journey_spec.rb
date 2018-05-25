require 'journey'

describe Journey do
  context 'initializes without an entry_station' do
    subject(:journey) { Journey.new }

    it 'responds to #finish, #fare, and #complete?' do
      expect(journey).to respond_to :finish
      expect(journey).to respond_to :fare
      expect(journey).to respond_to :complete?
    end
    it 'entry_station is optional' do
      expect{ journey }.not_to raise_error
    end
    describe '#fare' do
      it 'returns the penalty fare' do
        journey.finish("Brook Green")
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end
    end
    describe '#complete' do
      it 'returns true when the journey is open' do
        expect(journey.complete?).to eq false
      end
      it 'returns false when the journey is closed' do
        journey.finish("Brook Green")
        expect(journey.complete?).to eq true
      end
    end
  end

  context 'initializes with an entry_station' do
    subject(:journey) { Journey.new("Hammersmith") }
    it 'can have a entry_station' do
      expect{ journey }.not_to raise_error
    end
    it 'has an exit_station'do
      expect{ journey.exit_station = "London Bridge" }.not_to raise_error
    end

    describe '#finish' do
      it 'sets the exit_station' do
        journey.finish("Brook Green")
        expect(journey.exit_station).to eq "Brook Green"
      end
      it 'ends the journey' do
        journey.finish("Brook Green")
        expect(journey.en_route).to eq false
      end
    end

    describe '#fare' do
      it 'returns the minimum fare if both stations' do
        journey.finish("Brook Green")
        expect(journey.fare).to eq Journey::MINIMUM_FARE
      end
    end
  end

end
