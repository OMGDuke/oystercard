require 'journey'

describe Journey do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  subject(:journey) { described_class.new(entry_station) }

  describe "#complete?" do
    context "journey is empty" do
      it "returns true" do
        subject.end(exit_station)
        expect(journey.complete?).to eq true
      end
    end
    context "journey has a start but no end" do
      it "returns false" do
        expect(journey.complete?).to eq false
      end
    end
    context "journey has start and end" do
      it "returns true" do
        journey.end(exit_station)
        expect(journey.complete?).to eq true
      end
    end
  end

  describe "#fare" do
    it "returns the minimum fare for complete journeys" do
      allow(journey).to receive(:complete?) { true }
      expect(journey.fare).to eq Journey::MIN_FARE
    end
    it "returns the penalty fare for incomplete journeys" do
      allow(journey).to receive(:complete?) { false }
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end