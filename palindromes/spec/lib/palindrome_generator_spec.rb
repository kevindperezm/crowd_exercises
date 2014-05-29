# encoding: utf-8

require 'spec_helper'

describe PalindromeGenerator do
  let(:validators) do
    [LengthValidator.new, RepeatedCharsValidator.new, EvenRepeatValidator.new]
  end
  let(:pal_gen) { PalindromeGenerator.new validators }

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

  context '#palindrome?' do
    it 'returns true when string is a palindrome, like "ana"' do
      expect(pal_gen.palindrome? 'ana').to be_true
    end
    it 'returns true when string is not a palindrome, like "aero"' do
      expect(pal_gen.palindrome? 'aero').to be_false
    end
    it 'returns false with string "atgga"' do
      expect(pal_gen.palindrome? 'atgga').to be_false
    end
    it 'returns false with string "gtaag"' do
      expect(pal_gen.palindrome? 'gtaag').to be_false
    end
  end
end
