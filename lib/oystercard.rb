class Oystercard
  DEFAULT_VALUE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
  end
end
