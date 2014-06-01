# encoding: utf-8

# A better implementation of a palindrome generator engine.
# This class attempts to generate not just one palindrome
# per string, but to create as many palindromes as possible,
# considering performance.
class BetterEngine
  def generate(string)
    fail 'Too long string.' unless validate? string
    chars = string.chars
    isolated = isolated_char chars
    palindromes = []
    randomizable_array(chars).permutation.to_a.uniq.each do |permutation|
      palindromes << (permutation.join << isolated << permutation.reverse.join)
    end
    puts palindromes
    palindromes
  end

  private

  def validate?(string)
    string.size <= 16
  end

  def isolated_char(chars)
    char = chars.select { |c| chars.count(c).odd? }.uniq.join
    chars.delete_at chars.index(char) if char.size > 0
    char
  end

  def randomizable_array(chars)
    cloned_chars = chars.clone
    randomizable = []
    cloned_chars.each do |c|
      (cloned_chars.count(c) / 2).times { randomizable << c }
      cloned_chars.delete c
    end
    randomizable
  end
end
