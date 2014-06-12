
# Load missile data from a file
class FileInput
  def initialize(path)
    fail FileNotFoundError unless File.exist?(path)
    @path = path
  end

  def missiles
    fill_missiles
  end

  private

  def fill_missiles
    missiles = []
    lines = IO.readlines(@path)
    missile_quantity = lines.shift.to_i
    missile_quantity.times { |i| missiles << lines[i].to_i }
    fail ImpossibleToParse if lines.size > 0 && missiles.size <= 0
    missiles
  end
end

class FileNotFoundError < IOError
end

class ImpossibleToParse < StandardError
end
