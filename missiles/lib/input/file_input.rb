
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
    file = open(@path, 'r')
    missile_quantity = file.readline.to_i
    missile_quantity.times { missiles << file.readline.to_i }
    file.close
    missiles
  end
end

class FileNotFoundError < IOError
end

class InvalidMissileFile < StandardError
end
