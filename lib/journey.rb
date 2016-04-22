class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(station)
    @entry_station = station
    @complete  = false
  end

  def end(station)
    @exit_station = station
    @complete = true
  end

  def complete?
    @complete
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

end