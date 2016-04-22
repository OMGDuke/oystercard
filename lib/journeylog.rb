require_relative "journey"

class JourneyLog
  attr_reader :journey_class, :fare

  def initialize(journey_class=Journey)
    @journey_class = journey_class
    @journeys = []
    @fare = nil
  end

  def journeys
    @journeys.clone
  end

  def start(station)
    # if @journeys.last.length = 1 && @journeys.last.key?(:entry_station)
    if !@current_journey.nil? && !@current_journey.complete?
      @fare = @current_journey.fare
      @current_journey = @journey_class.new(station)
      @journeys << {entry_station: station}
    else
      @current_journey = @journey_class.new(station)
      @journeys << {entry_station: station}
    end
  end

  def finish(station)
    @current_journey.end(station)
    @journeys.last.merge!({exit_station: station})
    @fare = @current_journey.fare
    @current_journey = nil
  end

  def fare_due
    @fare
    @fare = 0
  end

  private

  def current_journey
    @journeys.last
  end
end
