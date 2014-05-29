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
      @output.write(validate?(@input_file.readline.chomp) ? "yes!\n" : "no!\n")
    end
    @output.close
  end

  def validate?(string)
    @validators.all? { |validator| validator.validate?(string) }
  end

  def generate_palindrome(string)
    return false unless validate? string
  end
end
