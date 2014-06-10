class FileInput
  def initialize(path)
    raise FileNotFoundError unless File.exists?(path)
    @file = open(path, "r")
  end

  def missiles
    fill_missiles
  end

  private

  def fill_missiles
    missiles = []
    missile_quantity = @file.readline.to_i
    missile_quantity.times { missiles << @file.readline.to_i }
    missiles
  end
end

class FileNotFoundError < IOError
end

class InvalidMissileFile < StandardError
end
