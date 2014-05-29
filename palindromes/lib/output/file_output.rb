# encoding: utf-8

# Generate file output for palindrome generator
class FileOutput
  def initialize(path)
    @path = path
  end

  def open
    @file = File.new @path, 'w'
  end

  def write(string)
    @file.write string
  end

  def close
    @file.close
    @file = nil
  end
end
