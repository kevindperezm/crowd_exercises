RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

require './lib/missile'
require './lib/input/file'
require './lib/output/file_output'
require './lib/binary_tree/tree'
require './lib/destruction_strategies/multiple_tree'
