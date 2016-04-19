require 'oystercard'
describe Oystercard do
  describe '#initialize balance' do
    it "has a variable balance and it is set to 0 by default" do
      expect(subject.balance).to eq(0)
    end
  end
  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument}
    it "can be topped up" do
      expect {subject.top_up(3)}.to change{ subject.balance}.by(3)
    end
    it "is raises an error if the top-up exceeds the limit" do
      limit = Oystercard::LIMIT
      subject.top_up(limit)
      message = "maximum limit is £#{limit}"
      expect {subject.top_up(1)}.to raise_error message
    end
  end
  describe '#deduct' do
    it {is_expected.to respond_to(:deduct)}
    it "reduces the balance by a specified amount" do
      expect {subject.deduct(3)}.to change{subject.balance}.by(-3)
    end
  end

  describe '#in_journey?' do
    it "returns false if we are not in a journey" do
      expect(subject.in_journey?).to eq false
    end
  end

end
