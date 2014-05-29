# encoding: utf-8

# Creates palindromes from string's chars of input file
class PalindromeGenerator
  def initialize(input_path, output, validators)
    @input_file = File.open input_path
    @output = output
    @validators = validators
  end

  def run
    lines_to_read = @input_file.readline.chomp.to_i
    @output.open
    lines_to_read.times do
      palindrome = generate_palindrome(@input_file.readline.chomp)
      @output.write(palindrome ? "#{palindrome}\n" : "-1\n")
    end
    @output.close
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
    chars.join
  end
end
