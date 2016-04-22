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
    complete? ? zone_calc : PENALTY_FARE
  end

  private
  def zone_calc
    zones = [@entry_station.zone, @exit_station.zone]
    (zones.max - zones.min) + 1
  end

end
