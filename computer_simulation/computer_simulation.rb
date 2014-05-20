module Generators
 
  class Multiplicative
 
    # Add default values: seed = 203, modulo = 100 and x0 = 9
    def initialize(options = {})
    	@seed = options[:seed] || 203
    	@modulo = options[:modulo] || 100
    	@x0 = options[:x0] || 9
    end
 
    def next
      @last_value = @seed * (@last_value || @x0) % @modulo
    end
 
  end
 
end
 
class CoinFlip
 
  def initialize(options = {})
    @generator =  validate ":generator", options[:generator] 
    @initial_bet = validate ":initial_bet", options[:initial_bet] { |value| value <= 0 }
    @amount = validate ":amount", options[:amount] { |value| value <= 0 }
  end

  private

  def validate(name, value, &block) 
    raise ArgumentError, "You must pass a valid #{name}." if value.nil? || (block && yield(value))
    value
  end

  public

  def play
    puts "Bet number\t| Amount before bet\t| Bet\t\t| pseudo-random\t| Won?\t\t| Amount after bet\t| Broke?\t|"

    bet = @initial_bet
    before_bet = @amount # Starting amount before bet

    (0...40).each do |bet_number|
      pseudo_random = @generator.next

      won_coin_flip = (pseudo_random > 500)

      if won_coin_flip
        after_bet = before_bet + bet # YOUT WIN THIS TIME!
        new_bet = @initial_bet # Restarts bet
      else
        after_bet = before_bet - bet # Lose...
        new_bet = bet * 2 # Doubles bet
        new_bet = after_bet if after_bet < new_bet
      end

      broken = after_bet <= 0

      # Printing results
      puts "#{bet_number}\t\t| #{before_bet}\t\t\t| #{bet}\t\t| #{pseudo_random}\t\t| #{won_coin_flip}\t\t| #{after_bet}\t\t\t| #{broken}\t\t|"

      bet = new_bet
      before_bet = after_bet

      break if broken
      puts "40 flips." if bet_number == 39
    end
    puts "Game over."
  end
 
end

# Testing

gen = Generators::Multiplicative.new
game = CoinFlip.new generator: gen, initial_bet: 25, amount: 5000
game.play