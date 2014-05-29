# encoding_ utf-8

require_relative 'lib/validators/length_validator'
require_relative 'lib/validators/repeated_chars_validator'
require_relative 'lib/validators/even_repeat_validator'
require_relative 'lib/palindrome_generator'

input = File.open ARGV[0], 'r'
output = File.new 'output.txt', 'w'
generator = PalindromeGenerator.new [LengthValidator.new,
                                     RepeatedCharsValidator.new,
                                     EvenRepeatValidator.new]

lines_to_read = input.readline.chomp.to_i
lines_to_read.times do
  palindrome = generator.generate_palindrome(input.readline.chomp)
  output.write(palindrome ? "#{palindrome}\n" : "-1\n")
end
output.close
