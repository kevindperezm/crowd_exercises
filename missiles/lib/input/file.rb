require_relative '../missile'
require_relative 'file_not_found'
require_relative 'impossible_to_parse'

module Input
  StandardFile = File

  # Load missile data from a file
  class File
    def initialize(path)
      fail FileNotFoundError unless StandardFile.exist?(path)
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
end
