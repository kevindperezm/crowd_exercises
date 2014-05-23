require_relative '../lib/random_generators/generators'
require_relative '../lib/coin_flip'

describe CoinFlip do

	INITIAL_BET = 25
	INITIAL_AMOUNT = 1_000

	before :each do
		@gen = Generators::Multiplicative.new
		@game = CoinFlip.new generator: @gen, 
		                     initial_bet: INITIAL_BET, 
		                     amount: INITIAL_AMOUNT
	end

	describe '#prepare_initial_bet' do
		it "sets @bet to the value of @initial_bet" do
			expect( @game.send(:prepare_initial_bet) ).to eql INITIAL_BET
		end
	end

	describe '#coin_flip!' do
		it 'changes the value of @random_number' do
			expect(@game.send())
		end
	end

end
