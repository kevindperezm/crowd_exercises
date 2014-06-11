require './lib/binary_tree/binary_tree_node'
require './lib/strategies/prune_strategy'
require './lib/input/file_input'
require './lib/output/file_output'

INPUT_FILE_EXTENSION = '.in'
OUTPUT_FILE_EXTENSION = '.out'
INPUT_DIRECTORY = '.'

Dir["#{INPUT_DIRECTORY}/*#{INPUT_FILE_EXTENSION}"].each do |entry|
  missiles = FileInput.new(entry).missiles
  optimal_route = PruneStrategy.new(missiles).optimal_missile_destruction_route
  basename = File.basename(entry, INPUT_FILE_EXTENSION)
  FileOutput.new("#{basename}#{OUTPUT_FILE_EXTENSION}").write(optimal_route)
end
