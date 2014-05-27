require_relative 'lib/coin_flip'
require_relative 'lib/output/console_output'
require_relative 'lib/random_generators/generators'

gen = Generators::Multiplicative.new
game = CoinFlip.new generator: gen,
                    initial_bet: 25,
                    amount: 5000,
                    output: ConsoleOutput.new
puts game.play
