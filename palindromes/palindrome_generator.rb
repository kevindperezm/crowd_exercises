# encoding_ utf-8

require_relative 'lib/output/file_output'
require_relative 'lib/validators/length_validator'
require_relative 'lib/validators/repeated_chars_validator'
require_relative 'lib/validators/even_repeat_validator'
require_relative 'lib/palindrome_generator'

output = FileOutput.new 'output.txt'
validators = [LengthValidator.new,
              RepeatedCharsValidator.new,
              EvenRepeatValidator.new]
generator = PalindromeGenerator.new 'input.txt', output, validators
generator.run # Here we go!
