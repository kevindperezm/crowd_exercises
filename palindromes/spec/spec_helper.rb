RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
require './lib/validators/length_validator'
require './lib/validators/repeated_chars_validator'
require './lib/validators/even_repeat_validator'
require './lib/strategies/basic_palindrome_strategy'
require './lib/palindrome_generator'
