# Converts temperatures from Celsius to Farenheit and viceversa
class Temperature
  def initialize(degrees)
    @degrees = degrees
  end

  def self.in_celsius(degrees)
    new(degrees)
  end

  def self.in_fahrenheit(degrees)
    new(degrees)
  end

  def to_far
    @degrees * 1.8 + 32
  end
end
