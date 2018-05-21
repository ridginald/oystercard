class Oystercard
  DEFAULT_VALUE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
  end

  def top_up(amount)
    raise 'Balance cannot be above £90' if full?
    @balance += amount
  end

  def full?
    @balance >= MAXIMUM_BALANCE
  end
end
