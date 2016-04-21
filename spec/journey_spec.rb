require 'journey'

describe Journey do

  let(:entrystation) {double :entrystation}
  let(:exitstation) {double :exitstation}
  let(:journey){ {entry_station: entrystation, exit_station: exitstation} }
  let(:entry_hash){ {entry_station: entrystation} }
  subject(:journey_sub) { described_class.new({entry_station: entrystation}) }

    describe '#journey' do
      it "stores entry and exit stations in a hash" do
        subject.end(exitstation)
        expect(subject.journey).to eq journey
      end

      it 'starts with an empty hash' do
        expect(subject.journey).to be_empty
      end
    end

    it "returns false on in_journey" do
      subject.end(exitstation)
      expect(subject.in_journey?).to eq false
    end

    it "remembers the last station" do
      subject.end(exitstation)
      expect(subject.journey[:exit_station]).to eq exitstation
    end

    describe '#complete?' do
      it "returns false if our journey is not completed" do
        expect(subject.complete?).to eq false
      end

      it "returns true on completion" do
        subject.end(exitstation)
        expect(subject.complete?).to eq true
      end
    end

    describe "#fare" do
      let(:station) { double :station, zone: 1}
      let(:station2) { double :station2, zone: 2 }
      let(:station_pen) {double :station_pen, zone: 0}
      subject(:journey_sub) { described_class.new({entry_station: station}) }

      it "returns minimum fare" do
        subject.end(exitstation)
        expect(subject.fare).to eq 1
      end
      it "returns 6 if journey not complete" do
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end

      it "calculates a fare between the same zone" do
        subject.end(station)
        subject.zone_calc
        expect(subject.fare).to eq 1
      end

      it "calculates a fare between zone 1 and 2" do
        subject.end(station2)
        subject.zone_calc
        expect(subject.fare).to eq 2
      end
    end
end
