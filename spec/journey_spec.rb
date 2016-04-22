require 'journey'

describe Journey do
  let(:entry_station) { double(:station, zone: 1) }
  let(:exit_station) { double(:station, zone: 2) }
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
    it "return 6 if journey not complete" do
      pen = Journey::PENALTY_FARE
      expect(subject.fare).to eq(pen)
    end
    it "calculates fare between the same zone" do
      subject.end(entry_station)
      expect(subject.fare).to eq 1
    end
    it "calculates fare between zone 1 and 2" do
      subject.end(exit_station)
      expect(subject.fare).to eq 2
    end
  end
end
