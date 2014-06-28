RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

require './lib/missile'
require './lib/input/file'
require './lib/output/file'
require './lib/binary_tree/tree'
require './lib/destruction_strategies/multiple_tree'
