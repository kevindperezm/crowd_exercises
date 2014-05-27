class CoinFlip
 
  def initialize(options = {})
    @generator =  validate_option "generator", options[:generator] 
    @initial_bet = validate_option "initial_bet", options[:initial_bet] { |value| value > 0 }
    @amount = validate_option "amount", options[:amount] { |value| value > 0 }
    @output_generator = options[:output]
    @turn_results = []
  end

  private

  def validate_option(name, value, &block) 
    if !value || (block && !yield(value))
      raise ArgumentError, "You must pass a valid #{name.to_sym}." 
    end
    value
  end

  def prepare_initial_bet
    @bet = @initial_bet
  end

  def play_turn(bet_number)
    before_flip_coin bet_number
    number = coin_flip!
    if won_coin_flip? number
      win_bet!
    else
      lose_bet!
    end
    after_flip_coin bet_number
  end

  def before_flip_coin(bet_number)
    @turn_results[bet_number] ||= {
      amount_before_bet: @amount,
      bet: @bet
    }
  end

  def after_flip_coin(bet_number)
    @turn_results[bet_number].merge!({
      amount_after_bet: @amount,
      pseudo_random: @random_number,
      won: won_coin_flip?(@random_number),
      broke: player_broken?(@amount)
    }) if @turn_results[bet_number]
  end

  def win_bet!
    @amount += @bet
    @bet = @initial_bet # Resets bet
  end

  def lose_bet!
    @amount -= @bet
    @bet = @bet * 2 # Doubles bet
    @bet = @amount if @amount < @bet # If amount is less than bet, bet falls to amount
  end

  def coin_flip!
    @random_number = @generator.next
  end

  def won_coin_flip?(number)
    number > 500
  end

  def player_broken?(amount)
    amount <= 0
  end

  def max_game_duration
    40 # Max game duration in turns
  end

  def generate_output
    @output_generator.generate(@turn_results) if @output_generator
  end

  public

  def play
    prepare_initial_bet
    max_game_duration.times do |bet_number| 
      play_turn bet_number 
      break if player_broken? @amount
    end
    generate_output
  end
  
end