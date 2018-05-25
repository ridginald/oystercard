class Journey
  # PENALTY_FARE = 6

  attr_accessor :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
  end

  def complete?
  end
end
