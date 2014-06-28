module Output
  # Outputs missile destruction route data to a file
  class File
    def initialize(path)
      @path = path
    end

    def write(missiles_route)
      open(@path, 'w') do |f|
        f.write("#{missiles_route.size}\n")
        missiles_route.each do|missile_position|
          f.write("#{missile_position}\n")
        end
      end
    end
  end
end
