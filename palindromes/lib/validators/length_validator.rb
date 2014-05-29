# encoding: utf-8

# Matcher for rule 'String has 2 or more chars in length'
class LengthValidator
  MIN_VALID_LENGTH = 2

  def validate?(string)
    string.length >= MIN_VALID_LENGTH
  end
end
