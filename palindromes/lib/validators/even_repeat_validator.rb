# encoding: utf-8

# Matcher for rule 'Repeat count for every char repetition is multiple of 2'
# This class also consider the next exceptions in its logic:
# * In case of odd-size string, there can be 1 and just 1 isolated char.
# * The isolated char can be one of the repeated chars.
class EvenRepeatValidator
  def validate?(string)
    string.chars.all? { |char| check_char?(string, char) } ||
    valid_isolated_char?(string)
  end

  private

  def check_char?(string, char)
    string.count(char) > 1 && string.count(char).even?
  end

  def valid_isolated_char?(string)
    string.chars.select { |c| string.count(c).odd? }.uniq.size == 1
  end
end
