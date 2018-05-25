require_relative 'journey'

class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance, :journey_history

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @journey_history = {}
  end

  def top_up(amount)
    raise "Balance cannot be above £ #{Oystercard::MAXIMUM_BALANCE}" if full?
    @balance += amount
  end

  def full?
    @balance >= MAXIMUM_BALANCE
  end

  def touch_in(entry_station = nil)
    raise "insufficent balance" if @balance < Journey::MINIMUM_FARE
    @journey_history[:entry] = entry_station
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey_history[:exit] = exit_station
    @journey.finish(exit_station)
    deduct(@journey.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
