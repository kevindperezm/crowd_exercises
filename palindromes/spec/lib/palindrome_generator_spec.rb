# encoding: utf-8

require 'spec_helper'

describe PalindromeGenerator do
  let(:validators) do
    [LengthValidator.new, RepeatedCharsValidator.new, EvenRepeatValidator.new]
  end
  let(:pal_gen) { PalindromeGenerator.new 'test_input.txt', nil, validators }

  context '#generate_palindrome' do
    it 'generates a palindrome from useful even-size string' do
      expect(%w(gaag agga).include? pal_gen.generate_palindrome 'gaga').to \
      be_true
    end
    it 'generates a palindrome from useful odd-size string' do
      expect(%w(gatag agtga).include? pal_gen.generate_palindrome 'gagat').to \
      be_true
    end
    it 'returns false if impossible to make palindromes from even-size string' \
    do
      expect(pal_gen.generate_palindrome 'qadw').to be_false
    end
    it 'returns false if impossible to make palindromes from odd-size string' \
    do
      expect(pal_gen.generate_palindrome 'qadws').to be_false
    end
  end
end
