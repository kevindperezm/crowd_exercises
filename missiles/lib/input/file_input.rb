require_relative '../missile'

# Load missile data from a file
class FileInput
  def initialize(path)
    fail FileNotFoundError unless File.exist?(path)
    @path = path
    @missiles = []
  end

  def missiles
    fill_missiles if @missiles.empty?
    @missiles
  end

  private

  def fill_missiles
    lines = IO.readlines(@path)
    missile_quantity = lines.shift.to_i
    missile_quantity.times do |i|
      @missiles << Missile.new(i + 1, lines[i].to_i)
    end
    fail ImpossibleToParse if lines.size > 0 && @missiles.size <= 0
  end
end

class FileNotFoundError < IOError
end

class ImpossibleToParse < StandardError
end
