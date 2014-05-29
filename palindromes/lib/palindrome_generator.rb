# encoding: utf-8

# Creates palindromes from string's chars of input file
class PalindromeGenerator
  def initialize(validators)
    @validators = validators
  end

  def validate?(string)
    @validators.all? { |validator| validator.validate?(string) }
  end

  def palindrome?(string)
    string == string.reverse
  end

  def generate_palindrome(string)
    return false unless validate? string
    chars = string.chars
    #chars.shuffle! until palindrome? chars.join
    chars.join
  end
end
