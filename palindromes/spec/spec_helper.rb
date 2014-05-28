RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
require './lib/validators/size_validator'
require './lib/validators/repeated_chars_validator'
require './lib/validators/repetition_count_validator'
