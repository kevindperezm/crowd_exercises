# encoding_ utf-8

require_relative 'lib/validators/length_validator'
require_relative 'lib/validators/repeated_chars_validator'
require_relative 'lib/validators/even_repeat_validator'
require_relative 'lib/strategies/basic_palindrome_strategy'
require_relative 'lib/palindrome_generator'

input = File.open ARGV[0], 'r'
output = File.new 'output.txt', 'w'
validators = [LengthValidator.new,
              RepeatedCharsValidator.new,
              EvenRepeatValidator.new]
generator = PalindromeGenerator.new BasicPalindromeStrategy.new, validators

lines_to_read = input.readline.chomp.to_i
lines_to_read.times do
  begin
    palindromes = generator.generate_palindromes(input.readline.chomp)
    output.write("#{palindromes[0]}\n")
  rescue PalindromeException
    output.write("-1\n")
  end
end
output.close
