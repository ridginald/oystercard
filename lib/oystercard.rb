class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance, :status

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance cannot be above £ #{Oystercard::MAXIMUM_BALANCE}" if full?
    @balance += amount
  end

  def full?
    @balance >= MAXIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def in_journey?
    @in_journey 
  end

  def touch_out
    @in_journey = false
  end
end
