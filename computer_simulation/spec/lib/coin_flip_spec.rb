require "spec_helper"

describe CoinFlip do

  describe '#new' do
    it 'raises ArgumentError if no random generator is passed in' do
      expect { CoinFlip.new(initial_bet: 300, amount: 5000, output: ConsoleOutput.new) }.
      to raise_error { ArgumentError }
    end
    it "doesn't complain if no output generator is passed in" do
      expect {CoinFlip.new(generator: Generators::Multiplicative.new,
                           initial_bet: 300,
                           amount: 1000)
      }.to_not raise_error { ArgumentError }
    end

    context 'when passing initial bet' do
      it 'raises ArgumentError if omitted' do
        expect {CoinFlip.new(generator: Generators::Multiplicative.new,
                             amount: 5000, 
                             output: ConsoleOutput.new) 
        }.to raise_error { ArgumentError }
      end
      it 'raises ArgumentError if less than 1' do
        expect {CoinFlip.new(generator: Generators::Multiplicative.new,
                             initial_bet: 0,
                             amount: 5000, 
                             output: ConsoleOutput.new) 
        }.to raise_error { ArgumentError }
      end
    end
    
    context 'when passing amout' do
      it 'raises ArgumentError if omitted' do
        expect {CoinFlip.new(generator: Generators::Multiplicative.new,
                             initial_bet: 300, 
                             output: ConsoleOutput.new) 
        }.to raise_error { ArgumentError }
      end
      it 'raises ArgumentError if less than 1' do
        expect {CoinFlip.new(generator: Generators::Multiplicative.new,
                             initial_bet: 300, 
                             amount: 0,
                             output: ConsoleOutput.new) 
        }.to raise_error { ArgumentError }
      end
    end

  end

  context 'using a valid instance' do
    let(:gen) { Generators::Multiplicative.new }
    let(:out) { ConsoleOutput.new }
    let(:coinflip) { CoinFlip.new generator: gen, initial_bet: 300, amount: 1000, output: out }

    describe '#validate_option' do
      it 'raises ArgumentError if value passed is nil' do
        expect { coinflip.send :validate_option, 'nil_value', nil }.
        to raise_error { ArgumentError }
      end
      it 'raises ArgumentError if block passed returns false' do
        expect { coinflip.send(:validate_option, 'valid_value', 9) { |v| false } }.
        to raise_error { ArgumentError }
      end
    end

    describe '#max_game_duration' do
      it 'should return 40' do 
        expect(coinflip.send :max_game_duration).to eql 40 
      end
    end

    describe '#prepare_initial_bet' do
      it 'sets first value of the bet to the initial bet and returns that value' do
        expect(coinflip.send :prepare_initial_bet).to eql 300
      end
    end

    describe '#player_broken?' do
      it 'returns true if the amount passed in is less than 1' do
        expect(coinflip.send :player_broken?, -56).to eql true
      end
    end

  end

end