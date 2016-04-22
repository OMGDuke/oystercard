require './lib/oystercard.rb'
require './lib/station.rb'

oy = Oystercard.new

stat1 = Station.new("baker", 1)
stat2 = Station.new("liverpool", 3)

oy.top_up(50)
oy.touch_in(stat1)
oy.journey_log.fare
oy.touch_in(stat2)
oy.journey_log.fare
oy.balance
oy.journey_log
