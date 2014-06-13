
# Outputs missile destruction route data to a file
class FileOutput
  def initialize(path)
    @path = path
  end

  def write(missiles_route)
    file = File.new(@path, 'w')
    file.write("#{missiles_route.size}\n")
    missiles_route.each do|missile_position|
      file.write("#{missile_position}\n")
    end
    file.close
  end
end
