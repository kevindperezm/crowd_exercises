# encoding: utf-8

require 'spec_helper'

describe PalindromeGenerator do
  let(:validators) do
    [LengthValidator.new, RepeatedCharsValidator.new, EvenRepeatValidator.new]
  end
  let(:gen) { PalindromeGenerator.new PalindromeEngine.new, validators }
  let(:gaga_palindromes) { %w(gaag agga) }
  let(:gagat_palindromes) { %w(gatag agtga) }

  context '#generate_palindromes' do
    it 'generates a palindrome from useful even-size string' do
      expect(gaga_palindromes.include? gen.generate_palindromes('gaga')[0]).to \
      be_true
    end
    it 'generates a palindrome from useful odd-size string' do
      expect(gagat_palindromes.include? gen.generate_palindromes('gagat')[0]).to \
      be_true
    end
    it 'returns false if impossible to make palindromes from even-size string' \
    do
      expect(gen.generate_palindromes 'qadw').to be_false
    end
    it 'returns false if impossible to make palindromes from odd-size string' \
    do
      expect(gen.generate_palindromes 'qadws').to be_false
    end
  end

  context '#palindrome?' do
    it 'returns true when string is a palindrome, like "ana"' do
      expect(gen.palindrome? 'ana').to be_true
    end
    it 'returns true when string is not a palindrome, like "aero"' do
      expect(gen.palindrome? 'aero').to be_false
    end
    it 'returns false with string "atgga"' do
      expect(gen.palindrome? 'atgga').to be_false
    end
    it 'returns false with string "gtaag"' do
      expect(gen.palindrome? 'gtaag').to be_false
    end
  end
end
