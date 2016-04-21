require_relative "journey"

class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class=Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
      @current_journey = journey_class.new(entry_station: station)
  end

  def finish(station)
    @current_journey.end(station)
    @journeys << @current_journey.journey
    print @current_journey.zone_calc
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  def zone

  end

  private
  def current_journey

    @current_journey || journey_class.new
  end

  def add(journey)
    @journeys << journey
  end



end
