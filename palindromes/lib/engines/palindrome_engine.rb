# encoding: utf-8

# Palindrome generator engine. Encapsulates palindrome generation logic.
# This simple engine creates a palindrome by sorting the string's chars
# and split them in two strings
class PalindromeEngine
  def generate(string)
    chars = string.chars.sort
    isolated_char = chars.select { |c| chars.count(c).odd? }.uniq.join
    chars.delete_at chars.index(isolated_char) if isolated_char.size > 0
    first_half, second_half = [], []
    until chars.empty?
      first_half << chars.shift
      second_half << chars.shift
    end
    [(first_half << isolated_char << second_half.reverse).join]
  end
end
