require './lib/oystercard.rb'
require './lib/station.rb'

oy = Oystercard.new

stat1 = Station.new("baker", 1)
stat2 = Station.new("liverpool", 2)

oy.top_up(50)
oy.touch_in(stat1)
oy.touch_out(stat2)
oy.balance
oy.journey_log
