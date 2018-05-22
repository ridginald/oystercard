class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  FARE = 1
  attr_reader :balance, :entry_station

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    raise "Balance cannot be above £ #{Oystercard::MAXIMUM_BALANCE}" if full?
    @balance += amount
  end

  def full?
    @balance >= MAXIMUM_BALANCE
  end

  def touch_in(station)
    raise "insufficent balance" if @balance < FARE
    @entry_station = station
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_out
    deduct(FARE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
