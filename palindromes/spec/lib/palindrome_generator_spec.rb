# encoding: utf-8

require 'spec_helper'

describe PalindromeGenerator do
  let(:validators) do
    [LengthValidator.new, RepeatedCharsValidator.new, EvenRepeatValidator.new]
  end
  let(:gen) { PalindromeGenerator.new BasicPalindromeStrategy.new, validators }
  let(:gaga_palindromes) { %w(gaag agga) }
  let(:gagat_palindromes) { %w(gatag agtga) }

  context '#generate_palindromes' do
    it 'generates a palindrome from useful even-size string' do
      generated_palindromes = gen.generate_palindromes('gaga')
      expect(gaga_palindromes.include? generated_palindromes[0]).to eql true
    end
    it 'generates a palindrome from useful odd-size string' do
      generated_palindromes = gen.generate_palindromes('gagat')
      expect(gagat_palindromes.include? generated_palindromes[0]).to eql true
    end
    it 'raises PalindromeException if even-size string can\'t be used to build
    palindromes' do
      expect { gen.generate_palindromes 'qadw' }
      .to raise_error { PalindromeException }
    end
    it 'raises PalindromeException if odd-size string can\'t be used to build
    palindromes' do
      expect { gen.generate_palindromes 'qadws' }
      .to raise_error { PalindromeException }
    end
  end

  context '#palindrome?' do
    it 'returns true when string is a palindrome, like "ana"' do
      expect(gen.palindrome? 'ana').to eql true
    end
    it 'returns true when string is not a palindrome, like "aero"' do
      expect(gen.palindrome? 'aero').to eql false
    end
    it 'returns false with string "atgga"' do
      expect(gen.palindrome? 'atgga').to eql false
    end
    it 'returns false with string "gtaag"' do
      expect(gen.palindrome? 'gtaag').to eql false
    end
  end
end
