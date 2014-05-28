# encoding: utf-8

# Matcher for rule 'Word has 2 or more chars in length'
class LengthValidator
  MIN_VALID_LENGTH = 2

  def validate(word)
    word.length >= MIN_VALID_LENGTH
  end
end
