require 'oystercard'

describe Oystercard do
	subject(:card) {Oystercard.new}
	let (:station1) {double :station}
	let (:station2) {double :station}


	describe '#initalize' do
		it 'has a default balance of £0' do
			expect(card.balance).to eq(0)
	  end
	end

	describe '#top_up' do

		it 'allows putting money on oystercard' do
			expect{card.top_up(3)}.to change{card.balance}.by(3)
		end
		it "can only top up to a maximum of £90" do
			max_balance = Oystercard::MAX_BALANCE
			card.top_up(max_balance)
			expect{card.top_up(6)}.to raise_error "Can't top up over £#{max_balance}"
		end
	end

	describe "#touch_in" do
		context "balance is less than the minimum fare" do
			it "raises an error" do
				expect {card.touch_in(station1)}.to raise_error "Insufficient funds"
			end
		end
	end

	describe "#touch_out" do
		before {card.top_up(Oystercard::MAX_BALANCE)}
		it "deducts the fare" do
			card.touch_in(station1)
				expect{card.touch_out(station2)}.to change{card.balance}
			end
	end
end

