require './lib/oystercard.rb'
require './lib/journey_log.rb'
require './lib/station.rb'

oy = Oystercard.new

jl = JourneyLog.new

stat1 = Station.new("baker", 1)
stat2 = Station.new("liverpool", 2)

jl.start(stat1)
jl.finish(stat2)

jl.journeys[0].zone_calc
