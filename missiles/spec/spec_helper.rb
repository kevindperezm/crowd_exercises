RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

require './lib/binary_tree/binary_tree_node'
require './lib/input/file_input'
require './lib/output/file_output'
