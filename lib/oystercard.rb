require_relative 'station'

class OysterCard
MIN_CHARGE = 1
MIN_BALANCE = 1
MAX_BALANCE = 90
attr_reader :balance, :journey, :entry_station

  def initialize
    @balance = 0

  end

  def top_up(amount)
    raise "Maximum balance is £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @entry_station != nil
#    if @journey == true
#      return true
# => else, return false

  end

  def touch_in(station)
    raise "Not enough funds" if @balance < MIN_BALANCE
    @entry_station = station

  end

  def touch_out
    deduct(MIN_CHARGE)
    @entry_station = nil

  end

end

#expect card to respond to touch_in, touch_out
#when touch_in, in_journey? returns true until touch_out
#when touch_out, in_journey? return false
