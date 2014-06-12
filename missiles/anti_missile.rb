#! /usr/bin/env ruby

require './lib/binary_tree/binary_tree_node'
require './lib/strategies/prune_strategy'
require './lib/input/file_input'
require './lib/output/file_output'

INPUT_FILE_EXTENSION = '.in'
OUTPUT_FILE_EXTENSION = '.out'
@failures = []

def main
  Dir["#{input_directory}/*#{INPUT_FILE_EXTENSION}"].each do |entry|
    begin
      parse_file(entry)
      show_success
    rescue ImpossibleToParse
      @failures.push(entry) && show_failure
    end
  end
  say_bye
end

def parse_file(entry)
  data = FileInput.new(entry).missiles
  optimal_route = PruneStrategy.new(data).optimal_missile_destruction_route
  basename = File.basename(entry, INPUT_FILE_EXTENSION)
  output_path = "#{input_directory}/#{basename}#{OUTPUT_FILE_EXTENSION}"
  FileOutput.new("#{output_path}").write(optimal_route)
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

def show_success
  putc '.'
end

def show_failure
  putc 'x'
end

def say_bye
  unless @failures.empty?
    puts "\n\nThere were failures\nFailures: "
    @failures.each { |entry| puts "\t* #{entry}" }
  end
  puts "\nDone"
end

main
