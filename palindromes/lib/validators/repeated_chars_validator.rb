# encoding: utf-8

# Matcher for rule 'Word repeats at least 2 times every char'
class RepeatedCharsValidator
  MIN_REPEATED_TIMES = 2

  def validate(word)
    word.chars.all? { |c| word.count(c) >= MIN_REPEATED_TIMES } ||
    isolated_chars(word).size == 1
  end

  private

  def isolated_chars(word)
    word.chars.select { |c| word.count(c) == 1 }
  end
end
