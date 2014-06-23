# Converts temperatures from Celsius to Farenheit and viceversa
class Temperature
  def initialize(degrees, unit)
    @degrees = degrees
    @unit = unit
  end

  def self.in_celsius(degrees)
    new(degrees, :celsius)
  end

  def self.in_fahrenheit(degrees)
    new(degrees, :fahrenheit)
  end

  def to_cel
    if @unit == :fahrenheit
      (@degrees - 32) / 1.8
    else
      @degrees
    end
  end

  def to_far
    if @unit == :celsius
      @degrees * 1.8 + 32
    else
      @degrees
    end
  end
end
