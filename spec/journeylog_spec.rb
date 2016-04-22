require "journeylog"

describe JourneyLog do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }
  let(:entry_hash) {{entry_station: entry_station}}
  let(:journey_hash) {{entry_station: entry_station, exit_station: exit_station}}
  subject(:journey_log) { described_class.new(journey_class) }

  describe "#initialize" do
    it "is empty" do
      expect(journey_log.journeys).to be_empty
    end
  end

  describe "#start" do
    it "starts a new journey" do
      journey_log.start(entry_station)
      expect(journey_log.journeys).to eq [entry_hash]
    end
  end

  describe "#finish" do
    it "contains a complete journey" do
      allow(journey).to receive(:end)
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.journeys).to eq [journey_hash]
    end
  end
end
