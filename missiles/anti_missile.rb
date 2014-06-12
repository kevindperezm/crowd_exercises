#! /usr/bin/env ruby

require './lib/binary_tree/binary_tree_node'
require './lib/strategies/prune_strategy'
require './lib/input/file_input'
require './lib/output/file_output'

INPUT_FILE_EXTENSION = '.in'
OUTPUT_FILE_EXTENSION = '.out'

def main
  Dir["#{input_directory}/*#{INPUT_FILE_EXTENSION}"].each do |entry|
    data = FileInput.new(entry).missiles
    optimal_route = PruneStrategy.new(data).optimal_missile_destruction_route
    basename = File.basename(entry, INPUT_FILE_EXTENSION)
    output_path = "#{input_directory}/#{basename}#{OUTPUT_FILE_EXTENSION}"
    FileOutput.new("#{output_path}").write(optimal_route)
    putc '.'
  end
  puts "\nOK"
end

def input_directory
  input_dir = nil
  begin
    ARGV[0].nil? ? fail(ArgumentError) : input_dir = ARGV[0].chomp('\\')
    fail IOError unless File.exist?(input_dir)
  rescue IOError
    invalid_input_dir(input_dir)
  rescue ArgumentError
    no_input_dir_specified
  end
  input_dir
end

def invalid_input_dir(input_dir)
  puts "Unreachable dir '#{input_dir}'\nExit"
  exit
end

def no_input_dir_specified
  puts 'No input directory specified'
  puts "Usage: #{__FILE__} [input dir]"
  exit
end

main
