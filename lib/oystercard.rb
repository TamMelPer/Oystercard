class OysterCard

MIN_BALANCE = 1
MAX_BALANCE = 90
attr_reader :balance, :journey

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Maximum balance is £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey == true
#    if @journey == true
#      return true
# => else, return false

  end

  def touch_in
    raise "Not enough funds" if @balance < MIN_BALANCE
    @journey = true
  end

  def touch_out
    @journey = false
  end

end

#expect card to respond to touch_in, touch_out
#when touch_in, in_journey? returns true until touch_out
#when touch_out, in_journey? return false
