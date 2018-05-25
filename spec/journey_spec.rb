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
    end
  end

end
