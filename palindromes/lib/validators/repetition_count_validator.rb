# encoding: utf-8

# Matcher for rule 'Repeat count for every char repetition is multiple of 2'
class RepetitionCountValidator
  def validate(string)
    string.chars.all? { |char| check_char?(string, char) } ||
    isolated_chars(string).size == 1
  end

  private

  def check_char?(string, char)
    string.count(char) > 1 && string.count(char).even?
  end

  def isolated_chars(string)
    string.chars.select { |c| string.count(c) == 1 }
  end
end
