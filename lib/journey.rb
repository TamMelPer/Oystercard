class Journey

MIN_CHARGE = 1
PENALTY = 6

attr_reader :entry_station, :exit_station

  def initialize(entry_station, exit_station=nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def fare
    return MIN_CHARGE if @entry_station && @exit_station
    return PENALTY
  end
end
