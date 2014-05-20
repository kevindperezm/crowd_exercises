require './lib/coin_flip'
require './lib/output/console_output'
require './lib/random_generators/generators'

gen = Generators::Multiplicative.new
game = CoinFlip.new generator: gen, initial_bet: 25, amount: 5000, output: ConsoleOutput.new
game.play