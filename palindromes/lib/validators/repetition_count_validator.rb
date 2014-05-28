# encoding: utf-8

# Matcher for rule 'Count for every char repetition is multiple of 2'
class RepetitionCountValidator
  def validate(word)
    word.chars.all? { |char| check_char?(word, char) } ||
    isolated_chars(word).size == 1
  end

  private

  def check_char?(word, char)
    word.count(char) > 1 && word.count(char).even?
  end

  def isolated_chars(word)
    word.chars.select { |c| word.count(c) == 1 }
  end
end
