require './lib/missile_destroyer'

class Launcher
  INPUT_EXT = '.in'
  OUTPUT_EXT = '.out'

  def initialize
    @input_dir = (ARGV[0] || '.').chomp('/').chomp('\\')
    @destroyer = MissileDestroyer.new
  end

  def run
    @start_time = Time.now
    input_files.each_pair do |input_path, output_path|
      if @destroyer.load_missiles_from_file(input_path)
        best_route = @destroyer.best_destruction_route
        @destroyer.write_route_to_file(best_route, output_path)
        putc '.'
      else
        putc 'x'
      end
    end
    @end_time = Time.now
    say_bye
  end

  private

  def input_files
    inputs_outputs = {}
    Dir["#{@input_dir}/*#{INPUT_EXT}"].each do |input_path|
      inputs_outputs[input_path] = output_for(input_path)
    end
    inputs_outputs
  end

  def output_for(input_path)
    input_path.sub(INPUT_EXT, OUTPUT_EXT)
  end

  def say_bye
    total_time = (@end_time - @start_time).to_f.round(4)
    puts "\nFinished in #{total_time} seconds."
    puts "Done."
  end
end

Launcher.new.run
