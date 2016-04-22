require_relative "journey"

class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class=Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def journeys
    @journeys.clone
  end

  def start(station)
    @current_journey = @journey_class.new(station)
    @journeys << {entry_station: station}
  end

  def finish(station)
    @current_journey.end(station)
    @journeys.last.merge!({exit_station: station})
    @current_journey = nil
  end

  private

  def current_journey
    @journeys.last
  end
end
