require 'Station'

describe Station do
  it 'holds names and zones' do
    station = Station.new("name", 1)
    expect(station.name).to eq "name"
    expect(station.zone).to eq 1
  end
end
