# DTO for missiles
class Missile
  include Comparable
  attr_accessor :position, :altitude

  def initialize(position, altitude)
    @position = position
    @altitude = altitude
  end

  def <=>(other)
    @altitude <=> other.altitude
  end
end
