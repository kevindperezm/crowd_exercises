# encoding: utf-8

# Creates palindromes from string's chars of input file
class PalindromeGenerator
  def initialize(engine, validators)
    @engine = engine
    @validators = validators
  end

  def validate?(string)
    @validators.all? { |validator| validator.validate?(string) }
  end

  def palindrome?(string)
    string == string.reverse
  end

  def generate_palindromes(string)
    return false unless validate? string
    @engine.generate string
  end
end
