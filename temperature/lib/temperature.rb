# Converts temperatures from Celsius to Farenheit and viceversa
class Temperature
  def initialize(degrees)
    @degrees = degrees
  end

  def self.in_celsius(degrees)
    Temperature.new(degrees)
  end

  def to_far
    @degrees * 1.8 + 32
  end
end
