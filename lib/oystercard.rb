class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  FARE = 1
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

  def touch_in(entry_station)
    raise "insufficent balance" if @balance < FARE
    @journey_history[:entry] = entry_station
  end

  def in_journey?
    @journey_history.size == 1

  end

  def touch_out(exit_station)
    deduct(FARE)
    @journey_history[:exit] = exit_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
