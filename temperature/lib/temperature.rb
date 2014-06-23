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
    convert_to :celsius
  end

  def to_far
    convert_to :fahrenheit
  end

  private

  def convert_to(unit)
    return @degrees if unit == @unit

    if unit == :celsius
      (@degrees - 32) / 1.8
    elsif unit == :fahrenheit
      @degrees * 1.8 + 32
    end
  end
end
