class FileOutput
  attr_accessor :missile_data

  def initialize(path)
    @path = path
  end

  def write(data)
    file = File.new(@path, 'w')
    file.write("#{data.size}\n")
    data.each { |value| file.write("#{@missile_data.index(value) + 1}\n") }
    file.close
  end
end
