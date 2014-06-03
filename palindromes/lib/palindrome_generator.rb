# encoding: utf-8

# Creates palindromes from string's chars of input file
class PalindromeGenerator
  def initialize(strategy, validators)
    @strategy = strategy
    @validators = validators
  end

  def validate?(string)
    @validators.all? { |validator| validator.validate?(string) }
  end

  def palindrome?(string)
    string == string.reverse
  end

  def generate_palindromes(string)
    fail PalindromeException, 'string can\'t be used to form palindromes' \
    unless validate? string
    @strategy.generate string
  end
end

# Exception when string can't be used to form palindromes
class PalindromeException < Exception
end
