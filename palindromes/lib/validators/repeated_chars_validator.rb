# encoding: utf-8

# Matcher for rule 'String repeats at least 2 times every char'
class RepeatedCharsValidator
  MIN_REPEATED_TIMES = 2

  def validate(string)
    string.chars.all? { |c| string.count(c) >= MIN_REPEATED_TIMES } ||
    isolated_chars(string).size == 1
  end

  private

  def isolated_chars(string)
    string.chars.select { |c| string.count(c) == 1 }
  end
end
