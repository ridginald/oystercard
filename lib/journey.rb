class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1
  attr_reader :en_route
  attr_accessor :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @en_route = true
  end

  def finish(exit_station)
    @exit_station = exit_station
    @en_route = false
  end

  def fare
    return PENALTY_FARE if @entry_station == nil
    return PENALTY_FARE if @exit_station == nil
    return MINIMUM_FARE
  end

  def complete?
  end
end
