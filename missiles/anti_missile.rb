#! /usr/bin/env ruby

require './lib/binary_tree/binary_tree_node'
require './lib/strategies/prune_strategy'
require './lib/input/file_input'
require './lib/output/file_output'

INPUT_FILE_EXTENSION = '.in'
OUTPUT_FILE_EXTENSION = '.out'

def input_directory
  input_dir = nil
  begin
    input_dir = ARGV[0].chomp('\\')
    fail IOError unless File.exist?(input_dir)
  rescue IOError
    puts "Unreachable dir '#{input_dir}'\nExit"
    exit
  end
  input_dir
end

Dir["#{input_directory}/*#{INPUT_FILE_EXTENSION}"].each do |entry|
  missiles = FileInput.new(entry).missiles
  optimal_route = PruneStrategy.new(missiles).optimal_missile_destruction_route
  basename = File.basename(entry, INPUT_FILE_EXTENSION)
  output_path = "#{input_directory}/#{basename}#{OUTPUT_FILE_EXTENSION}"
  FileOutput.new("#{output_path}").write(optimal_route)
  putc '.'
end
puts "\nOK"
