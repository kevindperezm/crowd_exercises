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
    chars = string.chars
    split_pos = chars.size.even? ? chars.size / 2 : (chars.size - 1) / 2
    chars.first(split_pos) == chars.last(split_pos).reverse
  end

  def generate_palindrome(string)
    return false unless validate? string
    chars = string.chars
    # chars.shuffle! until palindrome? chars.join
    chars.join
  end
end
