module Output
<<<<<<< HEAD
  StandardFile = File

=======
>>>>>>> make-antimissile-unaware-of-the-console
  # Outputs missile destruction route data to a file
  class File
    def initialize(path)
      @path = path
    end

    def write(missiles_route)
<<<<<<< HEAD
      file = StandardFile.new(@path, 'w')
      file.write("#{missiles_route.size}\n")
      missiles_route.each do|missile_position|
        file.write("#{missile_position}\n")
      end
      file.close
=======
      open(@path, 'w') do |f|
        f.write("#{missiles_route.size}\n")
        missiles_route.each do |missile_position|
          f.write("#{missile_position}\n")
        end
      end
>>>>>>> make-antimissile-unaware-of-the-console
    end
  end
end
