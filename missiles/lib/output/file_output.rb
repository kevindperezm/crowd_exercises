class FileOutput
  def initialize(path)
    @path = path
  end

  def write(data)
    file = File.new(@path, 'w')
    file.write("#{data.size}\n")
    data.each { |value| file.write("#{value}\n") }
    file.close
  end
end
